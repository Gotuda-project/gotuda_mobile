import Foundation
import Moya

enum RegisterEndpoint {
    case SendCode(phone: String)
    case ConfirmCode(request: ConfirmCodeRequest)
    case RegisterByPhone(request: RegisterByPhoneRequest)
}

extension RegisterEndpoint: TargetType {
    var baseURL: URL {
        URL(string: "http://127.0.0.1:5000")!
    }
    
    var path: String {
        switch self {
        case .SendCode(_): return "/api/v1/auth/phone/send_code"
        case .ConfirmCode(_): return "/api/v1/auth/phone/confirm"
        case .RegisterByPhone(_): return "/api/v1/auth/register_by_phone"
        }
    }
    
    var method: Moya.Method {
        .post
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Moya.Task {
        switch self {
        case .SendCode(let phone):
            return .requestParameters(parameters: ["phone": phone.digits], encoding: JSONEncoding.default)
        case .ConfirmCode(request: let request): return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        case .RegisterByPhone(request: let request): return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        }
        
    }
    
    var headers: [String : String]? {
        nil
    }
}


extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
}
