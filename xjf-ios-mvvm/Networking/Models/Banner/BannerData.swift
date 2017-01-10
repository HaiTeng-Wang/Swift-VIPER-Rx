//
//	BannerData.swift
//
//	Create by xijinfa on 10/1/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class BannerData: NSObject, NSCoding, Mappable {

	var cover: [Cover]?
	var createdAt: String?
	var id: Int?
	var link: String?
	var map: AnyObject?
	var sorting: Int?
	var status: Int?
	var title: String?
	var type: String?
	var updatedAt: String?
	var userId: Int?
	var viewCount: Int?

	class func newInstance(map: Map) -> Mappable? {
		return BannerData()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		cover <- map["cover"]
		createdAt <- map["created_at"]
		id <- map["id"]
		link <- map["link"]
		sorting <- map["sorting"]
		status <- map["status"]
		title <- map["title"]
		type <- map["type"]
		updatedAt <- map["updated_at"]
		userId <- map["user_id"]
		viewCount <- map["view_count"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         cover = aDecoder.decodeObject(forKey: "cover") as? [Cover]
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         link = aDecoder.decodeObject(forKey: "link") as? String
         sorting = aDecoder.decodeObject(forKey: "sorting") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         title = aDecoder.decodeObject(forKey: "title") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? Int
         viewCount = aDecoder.decodeObject(forKey: "view_count") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if cover != nil {
			aCoder.encode(cover, forKey: "cover")
		}
		if createdAt != nil {
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if id != nil {
			aCoder.encode(id, forKey: "id")
		}
		if link != nil {
			aCoder.encode(link, forKey: "link")
		}
		if sorting != nil {
			aCoder.encode(sorting, forKey: "sorting")
		}
		if status != nil {
			aCoder.encode(status, forKey: "status")
		}
		if title != nil {
			aCoder.encode(title, forKey: "title")
		}
		if type != nil {
			aCoder.encode(type, forKey: "type")
		}
		if updatedAt != nil {
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if userId != nil {
			aCoder.encode(userId, forKey: "user_id")
		}
		if viewCount != nil {
			aCoder.encode(viewCount, forKey: "view_count")
		}

	}

}
