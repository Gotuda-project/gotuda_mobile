import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift


class LikesService {
    
    private let disposeBag = DisposeBag()
    private let provider = MoyaProvider<LikesEndpoint>()
    static let shared = LikesService()
    private init() {
        
    }
    func getLikes(token: String, completion: @escaping ([Event]) -> Void) {
        let endpointClosure = { (target: LikesEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<LikesEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.GetLikes)
            .mapObject(GetEventResponse.self)
            .subscribe { events in
                completion(events.events ?? [])
            } onError: { error in
                completion([])
                print(error)
            }
            .disposed(by: disposeBag)

    }
    
}
