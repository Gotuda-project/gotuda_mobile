//
//  RegisterService.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 29.03.2024.
//

import Foundation
import Moya
import ObjectMapper


class RegisterService {

    static func sendCode(phone: String,  completion: @escaping (String?) -> Void) {
        let provider = MoyaProvider<RegisterEndpoint>()
        provider.request(.SendCode(phone: phone)) { result in
            switch result {
            case .success(let response):
                let token = try? response.mapObject(SendCodeModel.self)
                completion(token?.tokenForConfirm)
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
    
    static func confirmCode(request: ConfirmCodeRequest, completion: @escaping (String?) -> Void) {
        let provider = MoyaProvider<RegisterEndpoint>()
        provider.request(.ConfirmCode(request: request)) { result in
            switch result {
            case .success(let response):
                let token = try? response.mapObject(ConfirmCodeResponse.self)
                completion(token?.confimationPhoneToken)
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
    
    static func register(request: RegisterByPhoneRequest, completion: @escaping (String?) -> Void) {
        let provider = MoyaProvider<RegisterEndpoint>()
        provider.request(.RegisterByPhone(request: request)) { result in
            switch result {
            case .success(let response):
                let token = try? response.mapObject(RegisterByPhoneResponse.self)
                completion(token?.token)
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
    
}
