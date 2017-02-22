//
//	LoginUser.swift
//
//	Create by xijinfa on 11/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

public class User: NSObject, NSCoding, Mappable {

	public var accountBalance: Int?
	public var avatar: String?
	public var cashBalance: Int?
	public var chequeBalance: Int?
	public var courseCount: Int?
	public var createdAt: String?
	public var email: String?
	public var follower: Int?
	public var followerCount: Int?
	public var following: Int?
	public var followingCount: Int?
	public var grade: Int?
	public var gradeName: String?
	public var guruCount: Int?
	public var id: Int?
	public var intAge: String?
	public var intCompany: String?
	public var intName: String?
	public var intSex: Int?
	public var intSource: String?
	public var loginIp: String?
	public var loginPlatform: String?
	public var memo: String?
	public var name: String?
	public var nickname: String?
	public var party: Int?
	public var phone: String?
	public var platform: String?
	public var quote: String?
	public var registerIp: String?
	public var registerPlatform: String?
	public var registerSource: String?
	public var replyCount: Int?
	public var sex: Int?
	public var status: Int?
	public var subtitle: String?
	public var summary: String?
	public var topicCount: Int?
	public var updatedAt: String?

	class func newInstance(map: Map) -> Mappable? {
		return User()
	}
	required public init?(map: Map) {}
	private override init() {}

	public func mapping(map: Map) {
		accountBalance <- map["account_balance"]
		avatar <- map["avatar"]
		cashBalance <- map["cash_balance"]
		chequeBalance <- map["cheque_balance"]
		courseCount <- map["course_count"]
		createdAt <- map["created_at"]
		email <- map["email"]
		follower <- map["follower"]
		followerCount <- map["follower_count"]
		following <- map["following"]
		followingCount <- map["following_count"]
		grade <- map["grade"]
		gradeName <- map["grade_name"]
		guruCount <- map["guru_count"]
		id <- map["id"]
		intAge <- map["int_age"]
		intCompany <- map["int_company"]
		intName <- map["int_name"]
		intSex <- map["int_sex"]
		intSource <- map["int_source"]
		loginIp <- map["login_ip"]
		loginPlatform <- map["login_platform"]
		memo <- map["memo"]
		name <- map["name"]
		nickname <- map["nickname"]
		party <- map["party"]
		phone <- map["phone"]
		platform <- map["platform"]
		quote <- map["quote"]
		registerIp <- map["register_ip"]
		registerPlatform <- map["register_platform"]
		registerSource <- map["register_source"]
		replyCount <- map["reply_count"]
		sex <- map["sex"]
		status <- map["status"]
		subtitle <- map["subtitle"]
		summary <- map["summary"]
		topicCount <- map["topic_count"]
		updatedAt <- map["updated_at"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required public init(coder aDecoder: NSCoder) {
         accountBalance = aDecoder.decodeObject(forKey: "account_balance") as? Int
         avatar = aDecoder.decodeObject(forKey: "avatar") as? String
         cashBalance = aDecoder.decodeObject(forKey: "cash_balance") as? Int
         chequeBalance = aDecoder.decodeObject(forKey: "cheque_balance") as? Int
         courseCount = aDecoder.decodeObject(forKey: "course_count") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         follower = aDecoder.decodeObject(forKey: "follower") as? Int
         followerCount = aDecoder.decodeObject(forKey: "follower_count") as? Int
         following = aDecoder.decodeObject(forKey: "following") as? Int
         followingCount = aDecoder.decodeObject(forKey: "following_count") as? Int
         grade = aDecoder.decodeObject(forKey: "grade") as? Int
         gradeName = aDecoder.decodeObject(forKey: "grade_name") as? String
         guruCount = aDecoder.decodeObject(forKey: "guru_count") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         intAge = aDecoder.decodeObject(forKey: "int_age") as? String
         intCompany = aDecoder.decodeObject(forKey: "int_company") as? String
         intName = aDecoder.decodeObject(forKey: "int_name") as? String
         intSex = aDecoder.decodeObject(forKey: "int_sex") as? Int
         intSource = aDecoder.decodeObject(forKey: "int_source") as? String
         loginIp = aDecoder.decodeObject(forKey: "login_ip") as? String
         loginPlatform = aDecoder.decodeObject(forKey: "login_platform") as? String
         memo = aDecoder.decodeObject(forKey: "memo") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         nickname = aDecoder.decodeObject(forKey: "nickname") as? String
         party = aDecoder.decodeObject(forKey: "party") as? Int
         phone = aDecoder.decodeObject(forKey: "phone") as? String
         platform = aDecoder.decodeObject(forKey: "platform") as? String
         quote = aDecoder.decodeObject(forKey: "quote") as? String
         registerIp = aDecoder.decodeObject(forKey: "register_ip") as? String
         registerPlatform = aDecoder.decodeObject(forKey: "register_platform") as? String
         registerSource = aDecoder.decodeObject(forKey: "register_source") as? String
         replyCount = aDecoder.decodeObject(forKey: "reply_count") as? Int
         sex = aDecoder.decodeObject(forKey: "sex") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         subtitle = aDecoder.decodeObject(forKey: "subtitle") as? String
         summary = aDecoder.decodeObject(forKey: "summary") as? String
         topicCount = aDecoder.decodeObject(forKey: "topic_count") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc public func encode(with aCoder: NSCoder) {
		if accountBalance != nil {
			aCoder.encode(accountBalance, forKey: "account_balance")
		}
		if avatar != nil {
			aCoder.encode(avatar, forKey: "avatar")
		}
		if cashBalance != nil {
			aCoder.encode(cashBalance, forKey: "cash_balance")
		}
		if chequeBalance != nil {
			aCoder.encode(chequeBalance, forKey: "cheque_balance")
		}
		if courseCount != nil {
			aCoder.encode(courseCount, forKey: "course_count")
		}
		if createdAt != nil {
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if email != nil {
			aCoder.encode(email, forKey: "email")
		}
		if follower != nil {
			aCoder.encode(follower, forKey: "follower")
		}
		if followerCount != nil {
			aCoder.encode(followerCount, forKey: "follower_count")
		}
		if following != nil {
			aCoder.encode(following, forKey: "following")
		}
		if followingCount != nil {
			aCoder.encode(followingCount, forKey: "following_count")
		}
		if grade != nil {
			aCoder.encode(grade, forKey: "grade")
		}
		if gradeName != nil {
			aCoder.encode(gradeName, forKey: "grade_name")
		}
		if guruCount != nil {
			aCoder.encode(guruCount, forKey: "guru_count")
		}
		if id != nil {
			aCoder.encode(id, forKey: "id")
		}
		if intAge != nil {
			aCoder.encode(intAge, forKey: "int_age")
		}
		if intCompany != nil {
			aCoder.encode(intCompany, forKey: "int_company")
		}
		if intName != nil {
			aCoder.encode(intName, forKey: "int_name")
		}
		if intSex != nil {
			aCoder.encode(intSex, forKey: "int_sex")
		}
		if intSource != nil {
			aCoder.encode(intSource, forKey: "int_source")
		}
		if loginIp != nil {
			aCoder.encode(loginIp, forKey: "login_ip")
		}
		if loginPlatform != nil {
			aCoder.encode(loginPlatform, forKey: "login_platform")
		}
		if memo != nil {
			aCoder.encode(memo, forKey: "memo")
		}
		if name != nil {
			aCoder.encode(name, forKey: "name")
		}
		if nickname != nil {
			aCoder.encode(nickname, forKey: "nickname")
		}
		if party != nil {
			aCoder.encode(party, forKey: "party")
		}
		if phone != nil {
			aCoder.encode(phone, forKey: "phone")
		}
		if platform != nil {
			aCoder.encode(platform, forKey: "platform")
		}
		if quote != nil {
			aCoder.encode(quote, forKey: "quote")
		}
		if registerIp != nil {
			aCoder.encode(registerIp, forKey: "register_ip")
		}
		if registerPlatform != nil {
			aCoder.encode(registerPlatform, forKey: "register_platform")
		}
		if registerSource != nil {
			aCoder.encode(registerSource, forKey: "register_source")
		}
		if replyCount != nil {
			aCoder.encode(replyCount, forKey: "reply_count")
		}
		if sex != nil {
			aCoder.encode(sex, forKey: "sex")
		}
		if status != nil {
			aCoder.encode(status, forKey: "status")
		}
		if subtitle != nil {
			aCoder.encode(subtitle, forKey: "subtitle")
		}
		if summary != nil {
			aCoder.encode(summary, forKey: "summary")
		}
		if topicCount != nil {
			aCoder.encode(topicCount, forKey: "topic_count")
		}
		if updatedAt != nil {
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}
