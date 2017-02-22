//
//  DatabaseManager.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/11/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

public class DatabaseManager {

    public static func writeAccountToRealm(account: AccountRealm)->Observable<AccountRealm> {
       return Observable.create { subscribe in
            let realm = try! Realm()
            let accountCopy = account.clone()
            realm.beginWrite()
            realm.add(account, update: true)
            try! realm.commitWrite()
            subscribe.on(.next(accountCopy))
            subscribe.on(.completed)
            return Disposables.create()
        }
    }

    public static func readAccountFromRealm()->Observable<AccountRealm> {
        return Observable.create { subscribe in
            let realm = try! Realm()

            if let account = realm.objects(AccountRealm.self).first {
                subscribe.on(.next(account.clone()))
                subscribe.on(.completed)
            } else {
                subscribe.on(.next(AccountRealm()))
                subscribe.on(.completed)
            }

            return Disposables.create()
        }
    }

    public static func deleteAccountFromRealm()->Observable<AccountRealm> {
        return Observable.create { subscribe in
            let realm = try! Realm()

            if let account = realm.objects(AccountRealm.self).first {
                let accountCopy = account.clone()
                realm.beginWrite()
                realm.delete(account.credential!)
                realm.delete(account.user!)
                realm.delete(account)
                try! realm.commitWrite()
                subscribe.on(.next(accountCopy))
                subscribe.on(.completed)
            } else {
                subscribe.on(.next(AccountRealm()))
                subscribe.on(.completed)
            }
            return Disposables.create()
        }
    }
}
