//
//	LoginResult.swift
//
//	Create by xijinfa on 11/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class LoginResult: NSObject, NSCoding, Mappable {

	var credential: LoginCredential?
	var user: User?

	class func newInstance(map: Map) -> Mappable? {
		return LoginResult()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		credential <- map["credential"]
		user <- map["user"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         credential = aDecoder.decodeObject(forKey: "credential") as? LoginCredential
         user = aDecoder.decodeObject(forKey: "user") as? User

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if credential != nil {
			aCoder.encode(credential, forKey: "credential")
		}
		if user != nil {
			aCoder.encode(user, forKey: "user")
		}

	}

}
