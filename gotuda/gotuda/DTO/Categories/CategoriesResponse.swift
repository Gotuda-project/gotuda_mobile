import ObjectMapper

struct CategoriesResponse {
    var count: Int?
    var limit: Int?
    var offset: Int?
    var categories: [Category]?
}


extension CategoriesResponse: Mappable {
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        count <- map["count"]
        limit <- map["limit"]
        offset <- map["offset"]
        categories <- (map["categories"], ArrayTransform<Category>())
    }
}

class ArrayTransform<T: Mappable>: TransformType {
    typealias Object = [T]
    typealias JSON = [Any]

    init() {}

    func transformFromJSON(_ value: Any?) -> [T]? {
        return Mapper<T>().mapArray(JSONObject: value)
    }

    func transformToJSON(_ value: [T]?) -> [Any]? {
        return Mapper<T>().toJSONArray(value ?? [])
    }
}
