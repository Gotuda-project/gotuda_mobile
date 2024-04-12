import Moya

enum EventEndpoint {
    case CreateEvent(request: CreateEventRequest)
    case GetEvents(searchText: String)
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
        case .CreateEvent, .GetEvents: return "/api/v1/events"
        }
    }
    
    var method: Method {
        switch self {
        case .CreateEvent(_):
                .post
        case .GetEvents:
                .get
        }
        
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .CreateEvent(let request):
            return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        case .GetEvents(let searchText):
            return .requestParameters(parameters: ["text_search": searchText], encoding: URLEncoding.default)
        }
    }
}
