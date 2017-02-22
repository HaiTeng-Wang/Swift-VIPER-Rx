//
//	BannerCover.swift
//
//	Create by xijinfa on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

public class Cover: NSObject, NSCoding, Mappable {

	public var size: String?
	public var url: String?

	class func newInstance(map: Map) -> Mappable? {
		return Cover()
	}
	required public init?(map: Map) {}
	private override init() {}

	public func mapping(map: Map) {
		size <- map["size"]
		url <- map["url"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required public init(coder aDecoder: NSCoder) {
         size = aDecoder.decodeObject(forKey: "size") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc public func encode(with aCoder: NSCoder) {
		if size != nil {
			aCoder.encode(size, forKey: "size")
		}
		if url != nil {
			aCoder.encode(url, forKey: "url")
		}

	}

}
