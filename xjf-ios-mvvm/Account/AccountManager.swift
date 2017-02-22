//
//  AccountManager.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/11/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RxSwift
import AppData

extension String {
    var length: Int { return self.characters.count  }
}

class AccountManager {
    public static let sharedInstance = AccountManager()
    private var credential: CredentialRealm?
    private var user: UserRealm?

    private init() {
    }

    public func loadUserData() {
        DatabaseManager.readAccountFromRealm()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (account) in
                self.credential = account.credential
                self.user = account.user
            }, onError: { (error) in
                Logger.logError(message: "loadUserData onError I found \(error)!")
            }, onCompleted: {
            }).addDisposableTo(DisposeBag())
    }

    public func isLogin() -> Bool {
        return isInitialed() && ((self.credential?.bearer ?? "").length) > 0
    }

    public func setCredential(credential: CredentialRealm) {
        self.credential = credential.clone()
    }

    public func setUser(user: UserRealm) {
        self.user = user.clone()
    }

    public func getAccessToken() -> String {
        return isLogin() ? (self.credential?.bearer ?? "") : ""
    }

    public func isInitialed() -> Bool {
        return self.credential != nil && self.user != nil
    }

    public func logout() {
        DatabaseManager.deleteAccountFromRealm()
            .flatMap({ (account) -> Observable<NSString> in
                Logger.logInfo(message: "\(account.user?.id) logout")
                self.credential = nil
                self.user = nil
                return CacheManager.clearCache()
            })
            .flatMap({ (_) -> Observable<NSString> in
                return CacheManager.clearCacheWeekly()
            })
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (_) in
            }, onError: { (error) in
                Logger.logError(message: "onError I found \(error)!")
            })
            .addDisposableTo(DisposeBag())
    }
}
