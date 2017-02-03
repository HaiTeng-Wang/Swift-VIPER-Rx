//
//	CategoryData.swift
//
//	Create by xijinfa on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class CategoryData: NSObject, NSCoding, Mappable {

	var allowPreview: Int?
	var children: [CategoryData]?
	var cover: [Cover]?
	var department: String?
	var id: Int?
	var minGrade: Int?
	var mobileImageId: Int?
	var summary: String?
	var title: String?
	var type: String?
	var webImageId: Int?

	class func newInstance(map: Map) -> Mappable? {
		return CategoryData()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		allowPreview <- map["allow_preview"]
		children <- map["children"]
		cover <- map["cover"]
		department <- map["department"]
		id <- map["id"]
		minGrade <- map["min_grade"]
		mobileImageId <- map["mobile_image_id"]
		summary <- map["summary"]
		title <- map["title"]
		type <- map["type"]
		webImageId <- map["web_image_id"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         allowPreview = aDecoder.decodeObject(forKey: "allow_preview") as? Int
         children = aDecoder.decodeObject(forKey: "children") as? [CategoryData]
         cover = aDecoder.decodeObject(forKey: "cover") as? [Cover]
         department = aDecoder.decodeObject(forKey: "department") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         minGrade = aDecoder.decodeObject(forKey: "min_grade") as? Int
         mobileImageId = aDecoder.decodeObject(forKey: "mobile_image_id") as? Int
         summary = aDecoder.decodeObject(forKey: "summary") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         webImageId = aDecoder.decodeObject(forKey: "web_image_id") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if allowPreview != nil {
			aCoder.encode(allowPreview, forKey: "allow_preview")
		}
		if children != nil {
			aCoder.encode(children, forKey: "children")
		}
		if cover != nil {
			aCoder.encode(cover, forKey: "cover")
		}
		if department != nil {
			aCoder.encode(department, forKey: "department")
		}
		if id != nil {
			aCoder.encode(id, forKey: "id")
		}
		if minGrade != nil {
			aCoder.encode(minGrade, forKey: "min_grade")
		}
		if mobileImageId != nil {
			aCoder.encode(mobileImageId, forKey: "mobile_image_id")
		}
		if summary != nil {
			aCoder.encode(summary, forKey: "summary")
		}
		if title != nil {
			aCoder.encode(title, forKey: "title")
		}
		if type != nil {
			aCoder.encode(type, forKey: "type")
		}
		if webImageId != nil {
			aCoder.encode(webImageId, forKey: "web_image_id")
		}

	}

}
