import ObjectMapper

struct LoginResponse {
    var authToken: String?
}

extension LoginResponse: Mappable {
    init?(map: Map) {}
    
    init(
        authToken: String
    ) {
        self.authToken = authToken
    }
    
    mutating func mapping(map: Map) {
        authToken <- map["token"]
    }
}
