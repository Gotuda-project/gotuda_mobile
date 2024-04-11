import ObjectMapper

struct ImageResponse {
    var idImage: Int?
    var urlToImage: String?
}

extension ImageResponse: Mappable {
    init?(map: Map) {}
    
    init(
        idImage: Int,
        urlToImage: String
    ) {
        self.idImage = idImage
        self.urlToImage = urlToImage
    }
    
    mutating func mapping(map: Map) {
        idImage <- map["id"]
        urlToImage <- map["url_to_image"]
    }
}
