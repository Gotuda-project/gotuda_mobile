import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift


struct LikeError: Error {
    
}

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
    
    func setLike(eventId: Int, token: String?, completion: @escaping (Error?) -> Void) {
        guard let token else {
            completion(LikeError())
            return
        }
        let endpointClosure = { (target: LikesEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<LikesEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.SetLike(eventId: eventId))
            .subscribe { events in
                completion(nil)
            } onError: { error in
                completion(error)
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    func deleteLike(eventId: Int, token: String?, completion: @escaping (Error?) -> Void) {
        guard let token else  {
            completion(LikeError())
            return
        }
        let endpointClosure = { (target: LikesEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<LikesEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.DeleteLike(eventId: eventId))
            .subscribe { events in
                completion(nil)
            } onError: { error in
                completion(error)
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
}
