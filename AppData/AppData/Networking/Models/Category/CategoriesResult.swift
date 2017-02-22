//
//	CategoryResult.swift
//
//	Create by xijinfa on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

public class CategoriesResult: NSObject, NSCoding, Mappable {

	public var data: [CategoryData]?

	class public func newInstance(map: Map) -> Mappable? {
		return CategoriesResult()
	}
	required public init?(map: Map) {}
	private override init() {}

	public func mapping(map: Map) {
		data <- map["data"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required public init(coder aDecoder: NSCoder) {
         data = aDecoder.decodeObject(forKey: "data") as? [CategoryData]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc public func encode(with aCoder: NSCoder) {
		if data != nil {
			aCoder.encode(data, forKey: "data")
		}

	}

}
