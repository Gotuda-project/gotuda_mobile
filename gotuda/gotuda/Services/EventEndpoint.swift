import Moya

enum EventEndpoint {
    case CreateEvent(request: CreateEventRequest)
}

extension EventEndpoint: TargetType {
    
    var headers: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        URL(string: "http://127.0.0.1:5000")!
    }
    
    var path: String {
        switch self {
        case .CreateEvent: return "/api/v1/events"
        }
    }
    
    var method: Method {
        .post
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .CreateEvent(let request): 
            print(request)
            print(request.toJSONString(prettyPrint: true))
            return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        }
    }
}
