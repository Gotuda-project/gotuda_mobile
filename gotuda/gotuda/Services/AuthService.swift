import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift

final class AuthService {
    private let disposeBag = DisposeBag()
    private let provider = MoyaProvider<AuthEndpoint>()
    static let shared = AuthService()
    private init() {}
    
    func login(request: LoginRequest, completion: @escaping (String?) -> Void) {
        provider.rx.request(.Login(request: request))
            .mapObject(LoginResponse.self)
            .subscribe { loginResponse in
                completion(loginResponse.authToken)
            } onError: { error in
                completion(nil)
                print(error)
            }
            .disposed(by: disposeBag)

    }
}


