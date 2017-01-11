//
//  Account.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RealmSwift

class AccountRealm: Object {
    dynamic var rowId = 1
    dynamic var user: UserRealm?
    dynamic var credential: CredentialRealm?

    override static func primaryKey() -> String? {
        return "rowId"
    }

    public func clone() -> AccountRealm {
        let data = AccountRealm()
        data.credential = self.credential?.clone()
        data.user = self.user?.clone()
        return data
    }
}
