import ObjectMapper

struct CreateEventRequest {
    var title: String?
    var description: String?
    var address: Address?
    var eventDatetime: EventDatetime?
    var images: Images?
    var categories: [String]?
    var vibes: [String]?
}

struct Address: Mappable {
    var country: String?
    var city: String?
    var address: String?
    
    init(
        country: String,
        city: String,
        address: String
    ) {
        self.country = country
        self.city = city
        self.address = address
    }
    
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: ObjectMapper.Map) {
        country <- map["country"]
        city <- map["city"]
        address <- map["address"]
    }
}

struct EventDatetime: Mappable {
    var maxVisitors: Int?
    var datetime: String?
    
    init(
        maxVisitors: Int,
        datetime: String
    ) {
        self.maxVisitors = maxVisitors
        self.datetime = datetime
    }
    
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: ObjectMapper.Map) {
        maxVisitors <- map["max_count_visitors"]
        datetime <- map["datetime"]
    }
}

struct Images: Mappable {
    var ids: [Int]?
    var mainImageIndex: Int?
    
    init(
        ids: [Int],
        mainImageIndex: Int
    ) {
        self.ids = ids
        self.mainImageIndex = mainImageIndex
    }
    
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: ObjectMapper.Map) {
        ids <- map["ids"]
        mainImageIndex <- map["main_image_index"]
    }
}


extension CreateEventRequest: Mappable {
    
    init(
        title: String?,
        description: String?,
        address: Address?,
        eventDatetime: EventDatetime?,
        categories: [String]?,
        vibes: [String]?,
        images: Images? = nil
    ) {
        self.title = title
        self.description = description
        self.address = address
        self.eventDatetime = eventDatetime
        self.categories = categories
        self.vibes = vibes
        self.images = images
    }
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        address <- map["address"]
        images <- map["images"]
        eventDatetime <- map["event_datetime"]
        categories <- map["categories"]
        vibes <- map["vibes"]
    }
}
