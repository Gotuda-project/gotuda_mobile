import Moya

enum LikesEndpoint {
    case GetLikes
    case SetLike(eventId: Int)
    case DeleteLike(eventId: Int)
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
        case .SetLike(let eventId): return "/api/v1/likes/events/\(eventId)"
        case .DeleteLike(let eventId): return "/api/v1/likes/events/\(eventId)"
        }
    }
    
    var method: Method {
        switch self {
        case .GetLikes: .get
        case .SetLike(_): .post
        case .DeleteLike(_): .delete
        }
        
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .GetLikes, .SetLike(_), .DeleteLike(_): return .requestPlain
        }
    }
}
