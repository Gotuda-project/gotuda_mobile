import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift


class EventDatetimeService {
    
    private let disposeBag = DisposeBag()
    private let provider = MoyaProvider<EventDatetimeEndpoint>()
    static let shared = EventDatetimeService()
    private init() {
        
    }
    func getVisit(token: String, completion: @escaping ([Event]) -> Void) {
        let endpointClosure = { (target: EventDatetimeEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<EventDatetimeEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.GetVisit)
            .mapObject(GetEventResponse.self)
            .subscribe { events in
                completion(events.events ?? [])
            } onError: { error in
                completion([])
                print(error)
            }
            .disposed(by: disposeBag)

    }
    
    func visitEvent(eventdId: Int, token: String?, completion: @escaping (Error?) -> Void) {
        guard let token else {
            completion(LikeError())
            return
        }
        let endpointClosure = { (target: EventDatetimeEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<EventDatetimeEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.visitEvent(eventId: eventdId))
            .subscribe { response in
                completion(nil)
            } onError: { error in
                completion(error)
                print(error)
            }
            .disposed(by: disposeBag)

    }
    
    func nonVisitEvent(eventdId: Int, token: String?, completion: @escaping (Error?) -> Void) {
        guard let token else {
            completion(LikeError())
            return
        }
        let endpointClosure = { (target: EventDatetimeEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<EventDatetimeEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.notVisitEvent(eventId: eventdId))
            .subscribe { events in
                completion(nil)
            } onError: { error in
                completion(error)
                print(error)
            }
            .disposed(by: disposeBag)

    }
    
}
