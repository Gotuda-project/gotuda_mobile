//
//  RegisterThunk.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 30.03.2024.
//

import Foundation
import ReSwift
import ReSwiftThunk

func makeRegister(request: RegisterByPhoneRequest) -> Thunk<AppState> {
    return Thunk<AppState> { dispatch, getState in
        RegisterService.register(request: request) { token in
            if let token {
                dispatch(RegistrationAction.setToken(token))
            }
        }
    }

}




