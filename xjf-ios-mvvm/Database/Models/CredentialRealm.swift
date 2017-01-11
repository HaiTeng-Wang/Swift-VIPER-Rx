//
//  Credential.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RealmSwift

class CredentialRealm: Object {
    dynamic var rowId = 1
    dynamic var bearer: String?
    dynamic var expiredAt: String?

    override static func primaryKey() -> String? {
        return "rowId"
    }

    public func clone() -> CredentialRealm {
        let data = CredentialRealm()
        data.bearer=self.bearer
        data.expiredAt=self.expiredAt
        return data
    }

}
