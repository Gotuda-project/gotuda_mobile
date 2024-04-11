import Moya

enum ImageEndpoint {
    case Images(imageData: Data)
}

extension ImageEndpoint: TargetType {
    
    var headers: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        URL(string: "http://127.0.0.1:5000")!
    }
    
    var path: String {
        switch self {
        case .Images: return "/api/v1/images"
        }
    }
    
    var method: Method {
        .post
    }
    
    var sampleData: Data {
        Data()
    }
    
    var multipartBody :[Moya.MultipartFormData]?{
        switch self {
        case .Images(let imageData):
            // image want to upload it or file as a MultipartFormData
            let imageDataProvider = Moya.MultipartFormData(provider: MultipartFormData.FormDataProvider.data(imageData), name: "image", fileName: "photo.jpg", mimeType: "image/jpeg")
            return [ imageDataProvider]
        }
    }
    
    var task: Task {
        switch self {
        case .Images(let imageData):
            return .uploadMultipart(multipartBody!)
        }
    }
}

