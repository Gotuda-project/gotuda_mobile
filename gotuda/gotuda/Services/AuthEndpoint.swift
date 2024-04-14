import Moya

enum AuthEndpoint {
    case Login(request: LoginRequest)
}

extension AuthEndpoint: TargetType {
    var headers: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        URL(string: "http://127.0.0.1:5000")!
    }
    
    var path: String {
        switch self {
        case .Login(_): return "/api/v1/auth/login"
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
        case .Login(let request):
            return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        }
    }
}

