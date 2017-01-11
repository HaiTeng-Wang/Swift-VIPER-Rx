//
//  User.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RealmSwift

class UserRealm: Object {
     dynamic var id: Int64=0
     dynamic var nickname=""
     dynamic var memo=""
     dynamic var name=""
     dynamic var subtitle=""
     dynamic var summary=""
     dynamic var sex: Int64=0
     dynamic var quote=""
     dynamic var email=""
     dynamic var phone=""
     dynamic var intName=""
     dynamic var intCompany=""
     dynamic var intSex: Int64=0
     dynamic var intAge=""
     dynamic var intSource=""
     dynamic var grade: Int64=0
     dynamic var party: Int64=0
     dynamic var status: Int64=0
     dynamic var platform=""
     dynamic var registerIp=""
     dynamic var registerPlatform=""
     dynamic var registerSource=""
     dynamic var loginIp=""
     dynamic var loginPlatform=""
     dynamic var createdAt=""
     dynamic var updatedAt=""
     dynamic var avatar=""
     dynamic var following: Int64=0
     dynamic var follower: Int64=0
     dynamic var followingCount: Int64=0
     dynamic var followerCount: Int64=0
     dynamic var accountBalance: Int64=0
     dynamic var cashBalance: Int64=0
     dynamic var chequeBalance: Int64=0
     dynamic var topicCount: Int64=0
     dynamic var replyCount: Int64=0
     dynamic var guruCount: Int64=0
     dynamic var courseCount: Int64=0
     dynamic var gradeName=""
}
