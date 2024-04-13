import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift


class UserService {
    
    private let disposeBag = DisposeBag()
    private let provider = MoyaProvider<UserEndpoint>()
    static let shared = UserService()
    private init() {
        
    }
    func createAvatar(image: UIImage, token: String) {
        guard let imageData = image.pngData() else { return }
        let endpointClosure = { (target: UserEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<UserEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.CreateAvatar(imageData: imageData))
            .subscribe { imageResponse in
                print(imageResponse)
            } onError: { error in
                print(error)
            }
            .disposed(by: disposeBag)

    }
    
    func getMe(token: String, completion: @escaping (UserResponse?) -> Void) {
        let endpointClosure = { (target: UserEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<UserEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.GetMe)
            .mapObject(UserResponse.self)
            .subscribe { userResponse in
                completion(userResponse)
            } onError: { error in
                completion(nil)
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
}
