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
    dynamic var rowId = 1
    dynamic var accountBalance = 0
    dynamic var avatar: String?
    dynamic var cashBalance = 0
    dynamic var chequeBalance = 0
    dynamic var courseCount = 0
    dynamic var createdAt: String?
    dynamic var email: String?
    dynamic var follower = 0
    dynamic var followerCount = 0
    dynamic var following = 0
    dynamic var followingCount = 0
    dynamic var grade = 0
    dynamic var gradeName: String?
    dynamic var guruCount = 0
    dynamic var id = 0
    dynamic var intAge: String?
    dynamic var intCompany: String?
    dynamic var intName: String?
    dynamic var intSex = 0
    dynamic var intSource: String?
    dynamic var loginIp: String?
    dynamic var loginPlatform: String?
    dynamic var memo: String?
    dynamic var name: String?
    dynamic var nickname: String?
    dynamic var party = 0
    dynamic var phone: String?
    dynamic var platform: String?
    dynamic var quote: String?
    dynamic var registerIp: String?
    dynamic var registerPlatform: String?
    dynamic var registerSource: String?
    dynamic var replyCount = 0
    dynamic var sex = 0
    dynamic var status = 0
    dynamic var subtitle: String?
    dynamic var summary: String?
    dynamic var topicCount = 0
    dynamic var updatedAt: String?

    override static func primaryKey() -> String? {
        return "rowId"
    }

    public func clone() -> UserRealm {
        let data = UserRealm()
        data.accountBalance=self.accountBalance    // Int?
        data.avatar=self.avatar    // String?
        data.cashBalance=self.cashBalance    // Int?
        data.chequeBalance=self.chequeBalance    // Int?
        data.courseCount=self.courseCount    // Int?
        data.createdAt=self.createdAt    // String?
        data.email=self.email    // String?
        data.follower=self.follower    // Int?
        data.followerCount=self.followerCount    // Int?
        data.following=self.following    // Int?
        data.followingCount=self.followingCount    // Int?
        data.grade=self.grade    // Int?
        data.gradeName=self.gradeName    // String?
        data.guruCount=self.guruCount  // Int?
        data.id=self.id  // Int?
        data.intAge=self.intAge   // String?
        data.intCompany=self.intCompany  // String?
        data.intName=self.intName   // String?
        data.intSex=self.intSex  // Int?
        data.intSource=self.intSource// String?
        data.loginIp=self.loginIp// String?
        data.loginPlatform=self.loginPlatform   // String?
        data.memo=self.memo   // String?
        data.name=self.name   // String?
        data.nickname=self.nickname   // String?
        data.party=self.party// Int?
        data.phone=self.phone   // String?
        data.platform=self.platform   // String?
        data.quote=self.quote   // String?
        data.registerIp=self.registerIp   // String?
        data.registerPlatform=self.registerPlatform    // String?
        data.registerSource=self.registerSource   // String?
        data.replyCount=self.replyCount   // Int?
        data.sex=self.sex   // Int?
        data.status=self.status // Int?
        data.subtitle=self.subtitle   // String?
        data.summary=self.summary   // String?
        data.topicCount=self.topicCount    // Int?
        data.updatedAt=self.updatedAt    // String?
        return data
    }
}
