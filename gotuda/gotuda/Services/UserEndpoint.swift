import Moya

enum UserEndpoint {
    case CreateAvatar(imageData: Data)
    case GetMe
}

extension UserEndpoint: TargetType {
    
    var headers: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        URL(string: "http://127.0.0.1:5000")!
    }
    
    var path: String {
        switch self {
        case .CreateAvatar: return "/api/v1/users/me/avatar"
        case .GetMe: return "/api/v1/users/me"
        }
    }
    
    var method: Method {
        switch self {
        case .CreateAvatar:
                .post
        case .GetMe:
                .get
        }
        
    }
    
    var sampleData: Data {
        Data()
    }
    
    var multipartBody :[Moya.MultipartFormData]?{
        switch self {
        case .CreateAvatar(let imageData):
            // image want to upload it or file as a MultipartFormData
            let imageDataProvider = Moya.MultipartFormData(provider: MultipartFormData.FormDataProvider.data(imageData), name: "image", fileName: "photo.jpg", mimeType: "image/jpeg")
            return [ imageDataProvider]
        case .GetMe:
            return []
        }
    }
    
    var task: Task {
        switch self {
        case .CreateAvatar(let imageData):
            return .uploadMultipart(multipartBody!)
        case .GetMe:
            return .requestPlain
        }
    }
}
