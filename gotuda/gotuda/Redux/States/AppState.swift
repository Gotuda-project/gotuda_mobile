import Foundation
import ReSwift
import ReSwiftThunk


struct AppState: Equatable {
    var tokenForConfirm: String? = nil
    var confirmationPhoneToken: String? = nil
    var token: String? = nil
    var phone: String? = nil
}

enum AppStateAction: Action {
    case setFlag

}

func mainReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    switch action {
    case let action as RegistrationAction:
        return registerReducer(action: action, state: state)
    case let action as AuthAction:
        return authReducer(action: action, state: state)
    default:
        return state
    }
}

func registerReducer(action: RegistrationAction, state: AppState) -> AppState {
    var state = state
    switch action {

    case .setTokenForConfirm(let token):
        state.tokenForConfirm = token
    case .setConfirmationPhoneToken(let token):
        state.confirmationPhoneToken = token
    case .setToken(let token):
        state.token = token
    case .setPhoneNumber(let phone):
        state.phone = phone
    }

    return state
}

func authReducer(action: AuthAction, state: AppState) -> AppState {
    var state = state
    switch action {

    case .setAuthToken(let token):
        state.token = token
    }

    return state
}

let thunksMiddleware: Middleware<AppState> = createThunkMiddleware()

