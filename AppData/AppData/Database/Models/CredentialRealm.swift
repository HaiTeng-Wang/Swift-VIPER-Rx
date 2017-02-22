//
//  Credential.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RealmSwift

public class CredentialRealm: Object {
    public dynamic var rowId = 1
    public dynamic var bearer: String?
    public dynamic var expiredAt: String?

    override public static func primaryKey() -> String? {
        return "rowId"
    }

    public func clone() -> CredentialRealm {
        let data = CredentialRealm()
        data.bearer=self.bearer
        data.expiredAt=self.expiredAt
        return data
    }

}
