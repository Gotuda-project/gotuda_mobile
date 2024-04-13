import Moya

enum EventDatetimeEndpoint {
    case GetVisit
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
        case .GetVisit: return .requestPlain
        }
    }
}
