//
//	SecureResult.swift
//
//	Create by xijinfa on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class SecureResult: NSObject, NSCoding, Mappable {

	var secureCode: String?
	var secureImage: String?
	var secureKey: String?

	class func newInstance(map: Map) -> Mappable? {
		return SecureResult()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		secureCode <- map["secure_code"]
		secureImage <- map["secure_image"]
		secureKey <- map["secure_key"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         secureCode = aDecoder.decodeObject(forKey: "secure_code") as? String
         secureImage = aDecoder.decodeObject(forKey: "secure_image") as? String
         secureKey = aDecoder.decodeObject(forKey: "secure_key") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if secureCode != nil {
			aCoder.encode(secureCode, forKey: "secure_code")
		}
		if secureImage != nil {
			aCoder.encode(secureImage, forKey: "secure_image")
		}
		if secureKey != nil {
			aCoder.encode(secureKey, forKey: "secure_key")
		}

	}

}
