//
//	LoginCredential.swift
//
//	Create by xijinfa on 11/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class LoginCredential: NSObject, NSCoding, Mappable {

	var bearer: String?
	var expiredAt: String?

	class func newInstance(map: Map) -> Mappable? {
		return LoginCredential()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		bearer <- map["bearer"]
		expiredAt <- map["expired_at"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         bearer = aDecoder.decodeObject(forKey: "bearer") as? String
         expiredAt = aDecoder.decodeObject(forKey: "expired_at") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if bearer != nil {
			aCoder.encode(bearer, forKey: "bearer")
		}
		if expiredAt != nil {
			aCoder.encode(expiredAt, forKey: "expired_at")
		}

	}

}
