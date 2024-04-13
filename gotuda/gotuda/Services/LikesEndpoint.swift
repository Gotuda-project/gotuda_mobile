import Moya

enum LikesEndpoint {
    case GetLikes
}

extension LikesEndpoint: TargetType {
    
    var headers: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        URL(string: "http://127.0.0.1:5000")!
    }
    
    var path: String {
        switch self {
        case .GetLikes: return "/api/v1/likes/events/me"
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
        case .GetLikes: return .requestPlain
        }
    }
}
