//
//  AccountManager.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/11/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RxSwift

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
                print("loadUserData onError I found \(error)!")
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
                print("\(account.user?.id) logout")
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
                print("onError I found \(error)!")
            }, onCompleted: {
                print("logout onCompleted")
            }).addDisposableTo(DisposeBag())
    }
}
