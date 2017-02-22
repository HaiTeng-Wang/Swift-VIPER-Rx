//
//  User.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RealmSwift

public class UserRealm: Object {
    public dynamic var rowId = 1
    public dynamic var accountBalance = 0
    public dynamic var avatar: String?
    public dynamic var cashBalance = 0
    public dynamic var chequeBalance = 0
    public dynamic var courseCount = 0
    public dynamic var createdAt: String?
    public dynamic var email: String?
    public dynamic var follower = 0
    public dynamic var followerCount = 0
    public dynamic var following = 0
    public dynamic var followingCount = 0
    public dynamic var grade = 0
    public dynamic var gradeName: String?
    public dynamic var guruCount = 0
    public dynamic var id = 0
    public dynamic var intAge: String?
    public dynamic var intCompany: String?
    public dynamic var intName: String?
    public dynamic var intSex = 0
    public dynamic var intSource: String?
    public dynamic var loginIp: String?
    public dynamic var loginPlatform: String?
    public dynamic var memo: String?
    public dynamic var name: String?
    public dynamic var nickname: String?
    public dynamic var party = 0
    public dynamic var phone: String?
    public dynamic var platform: String?
    public dynamic var quote: String?
    public dynamic var registerIp: String?
    public dynamic var registerPlatform: String?
    public dynamic var registerSource: String?
    public dynamic var replyCount = 0
    public dynamic var sex = 0
    public dynamic var status = 0
    public dynamic var subtitle: String?
    public dynamic var summary: String?
    public dynamic var topicCount = 0
    public dynamic var updatedAt: String?

    override static public func primaryKey() -> String? {
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
