//
//	LoginCredential.swift
//
//	Create by xijinfa on 11/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

public class LoginCredential: NSObject, NSCoding, Mappable {

	public var bearer: String?
	public var expiredAt: String?

	class func newInstance(map: Map) -> Mappable? {
		return LoginCredential()
	}
	required public init?(map: Map) {}
	private override init() {}

	public func mapping(map: Map) {
		bearer <- map["bearer"]
		expiredAt <- map["expired_at"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required public init(coder aDecoder: NSCoder) {
         bearer = aDecoder.decodeObject(forKey: "bearer") as? String
         expiredAt = aDecoder.decodeObject(forKey: "expired_at") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc public func encode(with aCoder: NSCoder) {
		if bearer != nil {
			aCoder.encode(bearer, forKey: "bearer")
		}
		if expiredAt != nil {
			aCoder.encode(expiredAt, forKey: "expired_at")
		}

	}

}
