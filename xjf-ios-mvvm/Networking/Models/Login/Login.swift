//
//	Login.swift
//
//	Create by xijinfa on 11/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class Login: NSObject, NSCoding, Mappable {

	var errCode: Int?
	var errMsg: String?
	var result: LoginResult?

	class func newInstance(map: Map) -> Mappable? {
		return Login()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		errCode <- map["errCode"]
		errMsg <- map["errMsg"]
		result <- map["result"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         errCode = aDecoder.decodeObject(forKey: "errCode") as? Int
         errMsg = aDecoder.decodeObject(forKey: "errMsg") as? String
         result = aDecoder.decodeObject(forKey: "result") as? LoginResult

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if errCode != nil {
			aCoder.encode(errCode, forKey: "errCode")
		}
		if errMsg != nil {
			aCoder.encode(errMsg, forKey: "errMsg")
		}
		if result != nil {
			aCoder.encode(result, forKey: "result")
		}

	}

}
