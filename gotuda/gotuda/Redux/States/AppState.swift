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

    guard let action = action as? RegistrationAction else {
        return state
    }


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

let thunksMiddleware: Middleware<AppState> = createThunkMiddleware()

