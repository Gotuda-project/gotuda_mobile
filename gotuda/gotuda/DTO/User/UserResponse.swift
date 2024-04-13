import ObjectMapper

struct UserResponse: Mappable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var birthdate: String?
    var phoneNumber: String?
    var email: String?
    var avatar: UrlToImages?
    
    
    init?(map: ObjectMapper.Map) {}
    
    mutating func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        birthdate <- map["birthdate"]
        phoneNumber <- map["phone_number"]
        email <- map["email"]
        avatar <- map["avatar"]
    }
}
