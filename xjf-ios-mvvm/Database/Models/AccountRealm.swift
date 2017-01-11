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
    dynamic var user: UserRealm?
    dynamic var credential: CredentialRealm?
}
