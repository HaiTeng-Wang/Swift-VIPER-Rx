//
//	Course.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

public class Course: NSObject, NSCoding, Mappable {

	public var errCode: Int?
	public var errMsg: String?
	public var result: CourseData?

	class func newInstance(map: Map) -> Mappable? {
		return Course()
	}
	required public init?(map: Map) {}
	private override init() {}

	public func mapping(map: Map) {
		errCode <- map["errCode"]
		errMsg <- map["errMsg"]
		result <- map["result"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required public init(coder aDecoder: NSCoder) {
         errCode = aDecoder.decodeObject(forKey: "errCode") as? Int
         errMsg = aDecoder.decodeObject(forKey: "errMsg") as? String
         result = aDecoder.decodeObject(forKey: "result") as? CourseData

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc public func encode(with aCoder: NSCoder) {
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
