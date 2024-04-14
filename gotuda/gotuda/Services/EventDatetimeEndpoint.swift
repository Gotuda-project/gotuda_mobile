import Moya

enum EventDatetimeEndpoint {
    case GetVisit
    case visitEvent(eventId: Int)
    case notVisitEvent(eventId: Int)
}

extension EventDatetimeEndpoint: TargetType {
    
    var headers: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        URL(string: "http://127.0.0.1:5000")!
    }
    
    var path: String {
        switch self {
        case .GetVisit: return "/api/v1/event_datetime_visitors/me"
        case .visitEvent(let eventId): return "/api/v1/event_datetime/\(eventId)/visitors/me"
        case .notVisitEvent(let eventId): return "/api/v1/event_datetime/\(eventId)/visitors/me"
        }
    }
    
    var method: Method {
        switch self {
        case .GetVisit:
                .get
        case .visitEvent(let eventId):
                .post
        case .notVisitEvent(let eventId):
                .delete
        }
        
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .GetVisit: return .requestPlain
        case .visitEvent(let eventId): return .requestPlain
        case .notVisitEvent(let eventId): return .requestPlain
        }
    }
}
