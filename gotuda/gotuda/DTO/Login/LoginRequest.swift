import ObjectMapper

struct LoginRequest {
    var phone: String?
    var password: String?
}

extension LoginRequest: Mappable {
    init?(map: Map) {}
    
    init(
        phone: String,
        password: String
    ) {
        self.phone = phone
        self.password = password
    }
    
    mutating func mapping(map: Map) {
        phone <- map["phone"]
        password <- map["password"]
    }
}
