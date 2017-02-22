//
//	GuruResult.swift
//
//	Create by xijinfa on 4/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

public class GurusResult: NSObject, NSCoding, Mappable {

	public var currentPage: Int?
	public var data: [GuruData]?
	public var from: Int?
	public var lastPage: Int?
	public var nextPageUrl: AnyObject?
	public var perPage: Int?
	public var prevPageUrl: AnyObject?
	public var to: Int?
	public var total: Int?

	class func newInstance(map: Map) -> Mappable? {
		return GurusResult()
	}
	required public init?(map: Map) {}
	private override init() {}

	public func mapping(map: Map) {
		currentPage <- map["current_page"]
		data <- map["data"]
		from <- map["from"]
		lastPage <- map["last_page"]
		nextPageUrl <- map["next_page_url"]
		perPage <- map["per_page"]
		prevPageUrl <- map["prev_page_url"]
		to <- map["to"]
		total <- map["total"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required public init(coder aDecoder: NSCoder) {
         currentPage = aDecoder.decodeObject(forKey: "current_page") as? Int
         data = aDecoder.decodeObject(forKey: "data") as? [GuruData]
         from = aDecoder.decodeObject(forKey: "from") as? Int
         lastPage = aDecoder.decodeObject(forKey: "last_page") as? Int
         nextPageUrl = aDecoder.decodeObject(forKey: "next_page_url") as? AnyObject
         perPage = aDecoder.decodeObject(forKey: "per_page") as? Int
         prevPageUrl = aDecoder.decodeObject(forKey: "prev_page_url") as? AnyObject
         to = aDecoder.decodeObject(forKey: "to") as? Int
         total = aDecoder.decodeObject(forKey: "total") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc public func encode(with aCoder: NSCoder) {
		if currentPage != nil {
			aCoder.encode(currentPage, forKey: "current_page")
		}
		if data != nil {
			aCoder.encode(data, forKey: "data")
		}
		if from != nil {
			aCoder.encode(from, forKey: "from")
		}
		if lastPage != nil {
			aCoder.encode(lastPage, forKey: "last_page")
		}
		if nextPageUrl != nil {
			aCoder.encode(nextPageUrl, forKey: "next_page_url")
		}
		if perPage != nil {
			aCoder.encode(perPage, forKey: "per_page")
		}
		if prevPageUrl != nil {
			aCoder.encode(prevPageUrl, forKey: "prev_page_url")
		}
		if to != nil {
			aCoder.encode(to, forKey: "to")
		}
		if total != nil {
			aCoder.encode(total, forKey: "total")
		}

	}

}
