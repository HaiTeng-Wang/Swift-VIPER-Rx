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
        if isInitialed() {
            if let bearer = self.credential?.bearer {
                if bearer.length > 0 {
                       return true
                }
            }
        }
        return false
    }

    public func setCredential(credential: CredentialRealm) {
        self.credential = credential.clone()
    }

    public func setUser(user: UserRealm) {
        self.user = user.clone()
    }

    public func getAccessToken() -> String {
        if isLogin() {
            if let bearer = self.credential?.bearer {
                return bearer
            }
        }
        return ""
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
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (_) in
            }, onError: { (error) in
                print("onError I found \(error)!")
            }, onCompleted: {
                print("logout onCompleted")
            }).addDisposableTo(DisposeBag())
    }
}