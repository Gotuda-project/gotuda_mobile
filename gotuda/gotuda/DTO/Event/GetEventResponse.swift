import ObjectMapper


struct GetEventResponse: Mappable {
    var count: Int?
    var limit: Int?
    var offset: Int?
    var events: [Event]?
    
    
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: ObjectMapper.Map) {
        count <- map["count"]
        limit <- map["limit"]
        offset <- map["offset"]
        events <- (map["items"], ArrayTransform<Event>())
    }
}

struct Event: Mappable {
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        userId <- map["user_id"]
        title <- map["title"]
        description <- map["description"]
        address <- map["address"]
        eventDatetime <- map["event_datetime"]
        images <- map["images"]
        categories <- map["categories"]
        vibes <- map["vibes"]
    }
    
    var id: Int?
    var userId: Int?
    var title: String?
    var description: String?
    var address: Address?
    var eventDatetime: EventDatetime?
    var images: CreatedImages?
    var categories: [String]?
    var vibes: [String]?
}

struct CreatedImages: Mappable {
    var urlToImages: [UrlToImages]?
    var mainImageIndex: Int?
    
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: ObjectMapper.Map) {
        urlToImages <- (map["url_to_images"], ArrayTransform<UrlToImages>())
        mainImageIndex <- map["main_image_index"]
    }
}

struct UrlToImages: Mappable {
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: ObjectMapper.Map) {
        urlToImage <- map["url_to_image"]
    }
    
    var urlToImage: String?
    
}
