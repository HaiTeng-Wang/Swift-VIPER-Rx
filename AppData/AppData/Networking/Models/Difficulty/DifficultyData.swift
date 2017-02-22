//
//	CoursesTaxonomyDifficulty.swift
//
//	Create by xijinfa on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

public class DifficultyData: NSObject, NSCoding, Mappable {

	public var allowPreview: Int?
	public var content: String?
	public var cover: [Cover]?
	public var createdAt: String?
	public var department: String?
	public var favoriteCount: Int?
	public var finish: Int?
	public var id: Int?
	public var keywords: String?
	public var likeCount: Int?
	public var minGrade: Int?
	public var origin: Int?
	public var originalPrice: String?
	public var previewVideoId: Int?
	public var price: Int?
	public var saleCount: Int?
	public var sorting: Int?
	public var status: Int?
	public var subtitle: String?
	public var summary: String?
	public var title: String?
	public var type: String?
	public var updatedAt: String?
	public var userId: Int?
	public var viewCount: Int?

	class func newInstance(map: Map) -> Mappable? {
		return DifficultyData()
	}
	required public init?(map: Map) {}
	private override init() {}

	public func mapping(map: Map) {
		allowPreview <- map["allow_preview"]
		content <- map["content"]
		cover <- map["cover"]
		createdAt <- map["created_at"]
		department <- map["department"]
		favoriteCount <- map["favorite_count"]
		finish <- map["finish"]
		id <- map["id"]
		keywords <- map["keywords"]
		likeCount <- map["like_count"]
		minGrade <- map["min_grade"]
		origin <- map["origin"]
		originalPrice <- map["original_price"]
		previewVideoId <- map["preview_video_id"]
		price <- map["price"]
		saleCount <- map["sale_count"]
		sorting <- map["sorting"]
		status <- map["status"]
		subtitle <- map["subtitle"]
		summary <- map["summary"]
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
    @objc required public init(coder aDecoder: NSCoder) {
         allowPreview = aDecoder.decodeObject(forKey: "allow_preview") as? Int
         content = aDecoder.decodeObject(forKey: "content") as? String
         cover = aDecoder.decodeObject(forKey: "cover") as? [Cover]
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         department = aDecoder.decodeObject(forKey: "department") as? String
         favoriteCount = aDecoder.decodeObject(forKey: "favorite_count") as? Int
         finish = aDecoder.decodeObject(forKey: "finish") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         keywords = aDecoder.decodeObject(forKey: "keywords") as? String
         likeCount = aDecoder.decodeObject(forKey: "like_count") as? Int
         minGrade = aDecoder.decodeObject(forKey: "min_grade") as? Int
         origin = aDecoder.decodeObject(forKey: "origin") as? Int
         originalPrice = aDecoder.decodeObject(forKey: "original_price") as? String
         previewVideoId = aDecoder.decodeObject(forKey: "preview_video_id") as? Int
         price = aDecoder.decodeObject(forKey: "price") as? Int
         saleCount = aDecoder.decodeObject(forKey: "sale_count") as? Int
         sorting = aDecoder.decodeObject(forKey: "sorting") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         subtitle = aDecoder.decodeObject(forKey: "subtitle") as? String
         summary = aDecoder.decodeObject(forKey: "summary") as? String
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
    @objc public func encode(with aCoder: NSCoder) {
		if allowPreview != nil {
			aCoder.encode(allowPreview, forKey: "allow_preview")
		}
		if content != nil {
			aCoder.encode(content, forKey: "content")
		}
		if cover != nil {
			aCoder.encode(cover, forKey: "cover")
		}
		if createdAt != nil {
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if department != nil {
			aCoder.encode(department, forKey: "department")
		}
		if favoriteCount != nil {
			aCoder.encode(favoriteCount, forKey: "favorite_count")
		}
		if finish != nil {
			aCoder.encode(finish, forKey: "finish")
		}
		if id != nil {
			aCoder.encode(id, forKey: "id")
		}
		if keywords != nil {
			aCoder.encode(keywords, forKey: "keywords")
		}
		if likeCount != nil {
			aCoder.encode(likeCount, forKey: "like_count")
		}
		if minGrade != nil {
			aCoder.encode(minGrade, forKey: "min_grade")
		}
		if origin != nil {
			aCoder.encode(origin, forKey: "origin")
		}
		if originalPrice != nil {
			aCoder.encode(originalPrice, forKey: "original_price")
		}
		if previewVideoId != nil {
			aCoder.encode(previewVideoId, forKey: "preview_video_id")
		}
		if price != nil {
			aCoder.encode(price, forKey: "price")
		}
		if saleCount != nil {
			aCoder.encode(saleCount, forKey: "sale_count")
		}
		if sorting != nil {
			aCoder.encode(sorting, forKey: "sorting")
		}
		if status != nil {
			aCoder.encode(status, forKey: "status")
		}
		if subtitle != nil {
			aCoder.encode(subtitle, forKey: "subtitle")
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
