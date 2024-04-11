import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift


class EventService {
    
    private let disposeBag = DisposeBag()
    private let provider = MoyaProvider<EventEndpoint>()
    static let shared = EventService()
    private init() {
        
    }
    func createEvent(request: CreateEventRequest, token: String, completion: @escaping () -> Void) {
        let endpointClosure = { (target: EventEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<EventEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.CreateEvent(request: request))
            .subscribe { response in
                completion()
            } onError: { error in
                completion()
                print(error)
            }
            .disposed(by: disposeBag)

    }
    
}

