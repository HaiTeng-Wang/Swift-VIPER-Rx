//
//	CoursesPriceList.swift
//
//	Create by xijinfa on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class CoursePriceList: NSObject, NSCoding, Mappable {

	var grade: Int?
	var gradeTitle: String?
	var price: Int?

	class func newInstance(map: Map) -> Mappable? {
		return CoursePriceList()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		grade <- map["grade"]
		gradeTitle <- map["grade_title"]
		price <- map["price"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         grade = aDecoder.decodeObject(forKey: "grade") as? Int
         gradeTitle = aDecoder.decodeObject(forKey: "grade_title") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if grade != nil {
			aCoder.encode(grade, forKey: "grade")
		}
		if gradeTitle != nil {
			aCoder.encode(gradeTitle, forKey: "grade_title")
		}
		if price != nil {
			aCoder.encode(price, forKey: "price")
		}

	}

}
