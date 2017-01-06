//
//  Account.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RealmSwift

class Account: Object {
    dynamic var user: User?
    dynamic var credential: Credential?
}
