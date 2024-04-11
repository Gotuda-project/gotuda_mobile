import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift


class CategoryService {
    
    private let disposeBag = DisposeBag()
    private let provider = MoyaProvider<CategoryEndpoint>()
    static let shared = CategoryService()
    private init() {
        
    }
    func getCategories(token: String, completion: @escaping ([Category]) -> Void) {
        let endpointClosure = { (target: CategoryEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<CategoryEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.Categories)
            .mapObject(CategoriesResponse.self)
            .subscribe { categoriesResponse in
                completion(categoriesResponse.categories ?? [])
            } onError: { error in
                completion([])
                print(error)
            }
            .disposed(by: disposeBag)

    }
    
}

