//
//  Account.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RealmSwift

public class AccountRealm: Object {
    public dynamic var rowId = 1
    public dynamic var user: UserRealm?
    public dynamic var credential: CredentialRealm?

    override static public func primaryKey() -> String? {
        return "rowId"
    }

    public func clone() -> AccountRealm {
        let data = AccountRealm()
        data.credential = self.credential?.clone()
        data.user = self.user?.clone()
        return data
    }
}
