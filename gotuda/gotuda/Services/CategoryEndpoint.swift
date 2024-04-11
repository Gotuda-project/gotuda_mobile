import Moya

enum CategoryEndpoint {
    case Categories
}

extension CategoryEndpoint: TargetType {
    
    var headers: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        URL(string: "http://127.0.0.1:5000")!
    }
    
    var path: String {
        switch self {
        case .Categories: return "/api/v1/categories"
        }
    }
    
    var method: Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .Categories: return .requestParameters(parameters: ["limit": "10", "offset": "0"], encoding: URLEncoding.default)
        }
    }
}
