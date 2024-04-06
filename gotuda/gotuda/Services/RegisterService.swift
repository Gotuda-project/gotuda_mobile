//
//  RegisterService.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 29.03.2024.
//

import Foundation
import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift


class RegisterService {
    
    private let disposeBag = DisposeBag()
    private let provider = MoyaProvider<RegisterEndpoint>()
    static let shared = RegisterService()
    private init() {
        
    }
    func sendCode(phone: String,  completion: @escaping (String?) -> Void) {
        provider.rx.request(.SendCode(phone: phone))
            .mapObject(SendCodeModel.self)
            .subscribe { sendCodeModel in
                completion(sendCodeModel.tokenForConfirm)
            } onError: { error in
                completion(nil)
                print(error)
            }
            .disposed(by: disposeBag)

    }
    
    func confirmCode(request: ConfirmCodeRequest, completion: @escaping (String?) -> Void) {
        provider.rx.request(.ConfirmCode(request: request))
            .mapObject(ConfirmCodeResponse.self)
            .subscribe(onSuccess: { confirmCodeResponse in
                completion(confirmCodeResponse.confimationPhoneToken)
            }, onError: { error in
                completion(nil)
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func register(request: RegisterByPhoneRequest, completion: @escaping (String?) -> Void) {
        provider.rx.request(.RegisterByPhone(request: request))
            .mapObject(RegisterByPhoneResponse.self)
            .subscribe(onSuccess: { registerByPhoneResponse in
                completion(registerByPhoneResponse.token)
            }, onError: { error in
                completion(nil)
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
}
