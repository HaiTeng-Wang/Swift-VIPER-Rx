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
    dynamic var bearer = ""
    dynamic var expiredAt = ""
}
