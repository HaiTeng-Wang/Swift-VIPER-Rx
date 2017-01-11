//
//  AccountDataMapper.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/11/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation

class AccountDataMapper {

    public static func mapUserToUserRealm(user: User) -> UserRealm {
        let userRealm = UserRealm()
        userRealm.accountBalance=user.accountBalance!    // Int?
        userRealm.avatar=user.avatar    // String?
        userRealm.cashBalance=user.cashBalance!    // Int?
        userRealm.chequeBalance=user.chequeBalance!    // Int?
        userRealm.courseCount=user.courseCount!    // Int?
        userRealm.createdAt=user.createdAt    // String?
        userRealm.email=user.email    // String?
        userRealm.follower=user.follower!    // Int?
        userRealm.followerCount=user.followerCount!    // Int?
        userRealm.following=user.following!    // Int?
        userRealm.followingCount=user.followingCount!    // Int?
        userRealm.grade=user.grade!    // Int?
        userRealm.gradeName=user.gradeName    // String?
        userRealm.guruCount=user.guruCount!  // Int?
        userRealm.id=user.id!  // Int?
        userRealm.intAge=user.intAge   // String?
        userRealm.intCompany=user.intCompany  // String?
        userRealm.intName=user.intName   // String?
        userRealm.intSex=user.intSex!  // Int?
        userRealm.intSource=user.intSource// String?
        userRealm.loginIp=user.loginIp// String?
        userRealm.loginPlatform=user.loginPlatform   // String?
        userRealm.memo=user.memo   // String?
        userRealm.name=user.name   // String?
        userRealm.nickname=user.nickname   // String?
        userRealm.party=user.party!// Int?
        userRealm.phone=user.phone   // String?
        userRealm.platform=user.platform   // String?
        userRealm.quote=user.quote   // String?
        userRealm.registerIp=user.registerIp   // String?
        userRealm.registerPlatform=user.registerPlatform    // String?
        userRealm.registerSource=user.registerSource   // String?
        userRealm.replyCount=user.replyCount!   // Int?
        userRealm.sex=user.sex!   // Int?
        userRealm.status=user.status! // Int?
        userRealm.subtitle=user.subtitle   // String?
        userRealm.summary=user.summary   // String?
        userRealm.topicCount=user.topicCount!    // Int?
        userRealm.updatedAt=user.updatedAt    // String?
        return userRealm
    }

      public static func mapLoginCredentialToCredentialRealm(credential: LoginCredential) -> CredentialRealm {
        let credentialRealm = CredentialRealm()
        credentialRealm.bearer = credential.bearer
        credentialRealm.expiredAt = credential.expiredAt
        return credentialRealm
    }
}
