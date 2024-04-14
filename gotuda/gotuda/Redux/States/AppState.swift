import Foundation
import ReSwift
import ReSwiftThunk


struct AppState: Equatable {
    var tokenForConfirm: String? = nil
    var confirmationPhoneToken: String? = nil
    var token: String? = nil
    var phone: String? = nil
    var categories: [Category] = []
    var showCreateOrder: Bool = true
    var likedEvents: Set<Int> = []
    var removeLikeEvent: Set<Int> = []
    var visitEvents: Set<Int> = []
    var notVisitEvents: Set<Int> = []
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
    case let action as CategoryAction:
        return categoryReducer(action: action, state: state)
    case let action as EventAction:
        return eventReducer(action: action, state: state)
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

func categoryReducer(action: CategoryAction, state: AppState) -> AppState {
    var state = state
    switch action {
    case .setCategories(let categories):
        state.categories = categories
    }
    
    return state
}

func eventReducer(action: EventAction, state: AppState) -> AppState {
    var state = state
    switch action {
    case .successCreate:
        state.showCreateOrder = false
    case .returnToCreate:
        state.showCreateOrder = true
    case .likeEvent(let eventId):
        state.likedEvents.insert(eventId)
        state.removeLikeEvent.remove(eventId)
    case .deleteLike(let eventId):
        state.removeLikeEvent.insert(eventId)
        state.likedEvents.remove(eventId)
    case .visitEvent(let eventId):
        state.visitEvents.insert(eventId)
        state.notVisitEvents.remove(eventId)
    case .notVisitEvent(let eventId):
        state.visitEvents.remove(eventId)
        state.notVisitEvents.insert(eventId)
    }
    
    return state
}

let thunksMiddleware: Middleware<AppState> = createThunkMiddleware()

