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
        userRealm.accountBalance=user.accountBalance ?? 0    // Int?
        userRealm.avatar=user.avatar    // String?
        userRealm.cashBalance=user.cashBalance ?? 0    // Int?
        userRealm.chequeBalance=user.chequeBalance ?? 0    // Int?
        userRealm.courseCount=user.courseCount ?? 0    // Int?
        userRealm.createdAt=user.createdAt    // String?
        userRealm.email=user.email    // String?
        userRealm.follower=user.follower ?? 0    // Int?
        userRealm.followerCount=user.followerCount ?? 0    // Int?
        userRealm.following=user.following ?? 0    // Int?
        userRealm.followingCount=user.followingCount ?? 0    // Int?
        userRealm.grade=user.grade ?? 0    // Int?
        userRealm.gradeName=user.gradeName    // String?
        userRealm.guruCount=user.guruCount ?? 0  // Int?
        userRealm.id=user.id ?? 0  // Int?
        userRealm.intAge=user.intAge   // String?
        userRealm.intCompany=user.intCompany  // String?
        userRealm.intName=user.intName   // String?
        userRealm.intSex=user.intSex ?? 0  // Int?
        userRealm.intSource=user.intSource// String?
        userRealm.loginIp=user.loginIp// String?
        userRealm.loginPlatform=user.loginPlatform   // String?
        userRealm.memo=user.memo   // String?
        userRealm.name=user.name   // String?
        userRealm.nickname=user.nickname   // String?
        userRealm.party=user.party ?? 0// Int?
        userRealm.phone=user.phone   // String?
        userRealm.platform=user.platform   // String?
        userRealm.quote=user.quote   // String?
        userRealm.registerIp=user.registerIp   // String?
        userRealm.registerPlatform=user.registerPlatform    // String?
        userRealm.registerSource=user.registerSource   // String?
        userRealm.replyCount=user.replyCount ?? 0   // Int?
        userRealm.sex=user.sex ?? 0   // Int?
        userRealm.status=user.status ?? 0 // Int?
        userRealm.subtitle=user.subtitle   // String?
        userRealm.summary=user.summary   // String?
        userRealm.topicCount=user.topicCount ?? 0    // Int?
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
