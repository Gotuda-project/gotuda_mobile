import ObjectMapper
struct Category: Equatable, Identifiable, Mappable {
    init?(map: ObjectMapper.Map) {
    }
    
    init(
        id: Int,
        shortName: String,
        description: String
    ) {
        self.id = id
        self.shortName = shortName
        self.description = description
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        shortName <- map["short_name"]
        description <- map["description"]
    }
    
    var id: Int?
    var shortName: String?
    var description: String?
}
