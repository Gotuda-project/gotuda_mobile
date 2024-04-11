import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift


class ImageService {
    
    private let disposeBag = DisposeBag()
    private let provider = MoyaProvider<ImageEndpoint>()
    static let shared = ImageService()
    private init() {
        
    }
    func saveImage(image: UIImage, token: String, completion: @escaping (ImageResponse?) -> Void) {
        guard let imageData = image.pngData() else { return }
        let endpointClosure = { (target: ImageEndpoint) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Bearer " + token])
        }
        let provider = MoyaProvider<ImageEndpoint>(endpointClosure: endpointClosure)
        provider.rx.request(.Images(imageData: imageData))
            .mapObject(ImageResponse.self)
            .subscribe { imageResponse in
                completion(imageResponse)
            } onError: { error in
                completion(nil)
                print(error)
            }
            .disposed(by: disposeBag)

    }
    
}
