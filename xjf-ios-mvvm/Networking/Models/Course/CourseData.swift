//
//	CoursesData.swift
//
//	Create by xijinfa on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class CourseData: NSObject, NSCoding, Mappable {

	var allowPreview: Int?
	var apiUri: String?
	var commentCount: Int?
	var content: String?
	var contentLikeCount: Int?
	var contentViewCount: Int?
	var cover: [Cover]?
	var createdAt: String?
	var department: String?
	var favoriteCount: Int?
	var finish: Int?
	var id: Int?
	var isAlbum: Bool?
	var keywords: String?
	var likeCount: Int?
	var lowestPrice: Int?
	var minGrade: Int?
	var minGradeTitle: String?
	var mobileContentCover: [Cover]?
	var origin: Int?
	var originalPrice: String?
	var previewVideoId: Int?
	var price: Int?
	var priceList: [CoursePriceList]?
	var saleCount: Int?
	var sorting: Int?
	var status: Int?
	var subtitle: String?
	var summary: String?
	var taxonomyCategories: [CategoryData]?
	var taxonomyDifficulties: [CourseTaxonomyDifficulty]?
	var taxonomyGurus: [GuruData]?
	var taxonomyTags: [CourseTaxonomyDifficulty]?
	var title: String?
	var type: String?
	var updatedAt: String?
	var uri: String?
	var userAllowBuy: Bool?
	var userFavored: Int?
	var userId: Int?
	var userLearned: Int?
	var userLessonsLearned: Int?
	var userLiked: Int?
	var userPaid: Bool?
	var userPlayed: Int?
	var userPlayedAt: String?
	var userPrice: Int?
	var userPurchased: Bool?
	var userSubscribed: Bool?
	var videoDuration: Int?
	var videoPreviewLimit: Int?
	var videoView: Int?
	var viewCount: Int?
	var webContentCover: [Cover]?
	var webUri: String?
    var coursesMenu: [CourseData]?
    var children: [CourseData]?
    var lessonsMenu: [CourseData]?

	class func newInstance(map: Map) -> Mappable? {
		return CourseData()
	}
	required init?(map: Map) {}
	private override init() {}

	func mapping(map: Map) {
		allowPreview <- map["allow_preview"]
		apiUri <- map["api_uri"]
		commentCount <- map["comment_count"]
		content <- map["content"]
		contentLikeCount <- map["content_like_count"]
		contentViewCount <- map["content_view_count"]
		cover <- map["cover"]
		createdAt <- map["created_at"]
		department <- map["department"]
		favoriteCount <- map["favorite_count"]
		finish <- map["finish"]
		id <- map["id"]
		isAlbum <- map["is_album"]
		keywords <- map["keywords"]
		likeCount <- map["like_count"]
		lowestPrice <- map["lowest_price"]
		minGrade <- map["min_grade"]
		minGradeTitle <- map["min_grade_title"]
		mobileContentCover <- map["mobile_content_cover"]
		origin <- map["origin"]
		originalPrice <- map["original_price"]
		previewVideoId <- map["preview_video_id"]
		price <- map["price"]
		priceList <- map["price_list"]
		saleCount <- map["sale_count"]
		sorting <- map["sorting"]
		status <- map["status"]
		subtitle <- map["subtitle"]
		summary <- map["summary"]
		taxonomyCategories <- map["taxonomy_categories"]
		taxonomyDifficulties <- map["taxonomy_difficulties"]
		taxonomyGurus <- map["taxonomy_gurus"]
		taxonomyTags <- map["taxonomy_tags"]
		title <- map["title"]
		type <- map["type"]
		updatedAt <- map["updated_at"]
		uri <- map["uri"]
		userAllowBuy <- map["user_allow_buy"]
		userFavored <- map["user_favored"]
		userId <- map["user_id"]
		userLearned <- map["user_learned"]
		userLessonsLearned <- map["user_lessons_learned"]
		userLiked <- map["user_liked"]
		userPaid <- map["user_paid"]
		userPlayed <- map["user_played"]
		userPlayedAt <- map["user_played_at"]
		userPrice <- map["user_price"]
		userPurchased <- map["user_purchased"]
		userSubscribed <- map["user_subscribed"]
		videoDuration <- map["video_duration"]
		videoPreviewLimit <- map["video_preview_limit"]
		videoView <- map["video_view"]
		viewCount <- map["view_count"]
		webContentCover <- map["web_content_cover"]
		webUri <- map["web_uri"]
        coursesMenu <- map["courses_menu"]
        children <- map["children"]
        lessonsMenu <- map["lessons_menu"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         allowPreview = aDecoder.decodeObject(forKey: "allow_preview") as? Int
         apiUri = aDecoder.decodeObject(forKey: "api_uri") as? String
         commentCount = aDecoder.decodeObject(forKey: "comment_count") as? Int
         content = aDecoder.decodeObject(forKey: "content") as? String
         contentLikeCount = aDecoder.decodeObject(forKey: "content_like_count") as? Int
         contentViewCount = aDecoder.decodeObject(forKey: "content_view_count") as? Int
         cover = aDecoder.decodeObject(forKey: "cover") as? [Cover]
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         department = aDecoder.decodeObject(forKey: "department") as? String
         favoriteCount = aDecoder.decodeObject(forKey: "favorite_count") as? Int
         finish = aDecoder.decodeObject(forKey: "finish") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isAlbum = aDecoder.decodeObject(forKey: "is_album") as? Bool
         keywords = aDecoder.decodeObject(forKey: "keywords") as? String
         likeCount = aDecoder.decodeObject(forKey: "like_count") as? Int
         lowestPrice = aDecoder.decodeObject(forKey: "lowest_price") as? Int
         minGrade = aDecoder.decodeObject(forKey: "min_grade") as? Int
         minGradeTitle = aDecoder.decodeObject(forKey: "min_grade_title") as? String
         mobileContentCover = aDecoder.decodeObject(forKey: "mobile_content_cover") as? [Cover]
         origin = aDecoder.decodeObject(forKey: "origin") as? Int
         originalPrice = aDecoder.decodeObject(forKey: "original_price") as? String
         previewVideoId = aDecoder.decodeObject(forKey: "preview_video_id") as? Int
         price = aDecoder.decodeObject(forKey: "price") as? Int
         priceList = aDecoder.decodeObject(forKey: "price_list") as? [CoursePriceList]
         saleCount = aDecoder.decodeObject(forKey: "sale_count") as? Int
         sorting = aDecoder.decodeObject(forKey: "sorting") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         subtitle = aDecoder.decodeObject(forKey: "subtitle") as? String
         summary = aDecoder.decodeObject(forKey: "summary") as? String
         taxonomyCategories = aDecoder.decodeObject(forKey: "taxonomy_categories") as? [CategoryData]
         taxonomyDifficulties = aDecoder.decodeObject(forKey: "taxonomy_difficulties") as? [CourseTaxonomyDifficulty]
         taxonomyGurus = aDecoder.decodeObject(forKey: "taxonomy_gurus") as? [GuruData]
         taxonomyTags = aDecoder.decodeObject(forKey: "taxonomy_tags") as? [CourseTaxonomyDifficulty]
         title = aDecoder.decodeObject(forKey: "title") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         uri = aDecoder.decodeObject(forKey: "uri") as? String
         userAllowBuy = aDecoder.decodeObject(forKey: "user_allow_buy") as? Bool
         userFavored = aDecoder.decodeObject(forKey: "user_favored") as? Int
         userId = aDecoder.decodeObject(forKey: "user_id") as? Int
         userLearned = aDecoder.decodeObject(forKey: "user_learned") as? Int
         userLessonsLearned = aDecoder.decodeObject(forKey: "user_lessons_learned") as? Int
         userLiked = aDecoder.decodeObject(forKey: "user_liked") as? Int
         userPaid = aDecoder.decodeObject(forKey: "user_paid") as? Bool
         userPlayed = aDecoder.decodeObject(forKey: "user_played") as? Int
         userPlayedAt = aDecoder.decodeObject(forKey: "user_played_at") as? String
         userPrice = aDecoder.decodeObject(forKey: "user_price") as? Int
         userPurchased = aDecoder.decodeObject(forKey: "user_purchased") as? Bool
         userSubscribed = aDecoder.decodeObject(forKey: "user_subscribed") as? Bool
         videoDuration = aDecoder.decodeObject(forKey: "video_duration") as? Int
         videoPreviewLimit = aDecoder.decodeObject(forKey: "video_preview_limit") as? Int
         videoView = aDecoder.decodeObject(forKey: "video_view") as? Int
         viewCount = aDecoder.decodeObject(forKey: "view_count") as? Int
         webContentCover = aDecoder.decodeObject(forKey: "web_content_cover") as? [Cover]
         webUri = aDecoder.decodeObject(forKey: "web_uri") as? String
         coursesMenu = aDecoder.decodeObject(forKey: "courses_menu") as? [CourseData]
         children = aDecoder.decodeObject(forKey: "children") as? [CourseData]
         lessonsMenu = aDecoder.decodeObject(forKey: "lessons_menu") as? [CourseData]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if allowPreview != nil {
			aCoder.encode(allowPreview, forKey: "allow_preview")
		}
		if apiUri != nil {
			aCoder.encode(apiUri, forKey: "api_uri")
		}
		if commentCount != nil {
			aCoder.encode(commentCount, forKey: "comment_count")
		}
		if content != nil {
			aCoder.encode(content, forKey: "content")
		}
		if contentLikeCount != nil {
			aCoder.encode(contentLikeCount, forKey: "content_like_count")
		}
		if contentViewCount != nil {
			aCoder.encode(contentViewCount, forKey: "content_view_count")
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
		if isAlbum != nil {
			aCoder.encode(isAlbum, forKey: "is_album")
		}
		if keywords != nil {
			aCoder.encode(keywords, forKey: "keywords")
		}
		if likeCount != nil {
			aCoder.encode(likeCount, forKey: "like_count")
		}
		if lowestPrice != nil {
			aCoder.encode(lowestPrice, forKey: "lowest_price")
		}
		if minGrade != nil {
			aCoder.encode(minGrade, forKey: "min_grade")
		}
		if minGradeTitle != nil {
			aCoder.encode(minGradeTitle, forKey: "min_grade_title")
		}
		if mobileContentCover != nil {
			aCoder.encode(mobileContentCover, forKey: "mobile_content_cover")
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
		if priceList != nil {
			aCoder.encode(priceList, forKey: "price_list")
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
		if taxonomyCategories != nil {
			aCoder.encode(taxonomyCategories, forKey: "taxonomy_categories")
		}
		if taxonomyDifficulties != nil {
			aCoder.encode(taxonomyDifficulties, forKey: "taxonomy_difficulties")
		}
		if taxonomyGurus != nil {
			aCoder.encode(taxonomyGurus, forKey: "taxonomy_gurus")
		}
		if taxonomyTags != nil {
			aCoder.encode(taxonomyTags, forKey: "taxonomy_tags")
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
		if uri != nil {
			aCoder.encode(uri, forKey: "uri")
		}
		if userAllowBuy != nil {
			aCoder.encode(userAllowBuy, forKey: "user_allow_buy")
		}
		if userFavored != nil {
			aCoder.encode(userFavored, forKey: "user_favored")
		}
		if userId != nil {
			aCoder.encode(userId, forKey: "user_id")
		}
		if userLearned != nil {
			aCoder.encode(userLearned, forKey: "user_learned")
		}
		if userLessonsLearned != nil {
			aCoder.encode(userLessonsLearned, forKey: "user_lessons_learned")
		}
		if userLiked != nil {
			aCoder.encode(userLiked, forKey: "user_liked")
		}
		if userPaid != nil {
			aCoder.encode(userPaid, forKey: "user_paid")
		}
		if userPlayed != nil {
			aCoder.encode(userPlayed, forKey: "user_played")
		}
		if userPlayedAt != nil {
			aCoder.encode(userPlayedAt, forKey: "user_played_at")
		}
		if userPrice != nil {
			aCoder.encode(userPrice, forKey: "user_price")
		}
		if userPurchased != nil {
			aCoder.encode(userPurchased, forKey: "user_purchased")
		}
		if userSubscribed != nil {
			aCoder.encode(userSubscribed, forKey: "user_subscribed")
		}
		if videoDuration != nil {
			aCoder.encode(videoDuration, forKey: "video_duration")
		}
		if videoPreviewLimit != nil {
			aCoder.encode(videoPreviewLimit, forKey: "video_preview_limit")
		}
		if videoView != nil {
			aCoder.encode(videoView, forKey: "video_view")
		}
		if viewCount != nil {
			aCoder.encode(viewCount, forKey: "view_count")
		}
		if webContentCover != nil {
			aCoder.encode(webContentCover, forKey: "web_content_cover")
		}
		if webUri != nil {
			aCoder.encode(webUri, forKey: "web_uri")
		}
        if coursesMenu != nil {
            aCoder.encode(coursesMenu, forKey: "courses_menu")
        }
        if children != nil {
            aCoder.encode(children, forKey: "children")
        }
        if lessonsMenu != nil {
            aCoder.encode(lessonsMenu, forKey: "lesson_menu")
        }

	}

}
