import ReSwift

enum RegistrationAction: Action {
    case setTokenForConfirm(String)
    case setConfirmationPhoneToken(String)
    case setToken(String)
    case setPhoneNumber(String)
}
