import SwiftUI


struct RegistrationView: View {
    @State private var phone: String = ""
    @State private var password: String = ""
    
    @State private var currentScreen: ScreenType = .phone
    var body: some View {
        if currentScreen == .phone {
            RegistrationPhoneView(currentScreen: $currentScreen)
        } else if currentScreen == .code {
            RegistrationCodeView(currentScreen: $currentScreen)
        }  else if currentScreen == .form {
            RegistrationCreateUserView()
        }
    }
    
    enum ScreenType {
        case phone
        case code
        case form
    }
}


#Preview {
    RegistrationView()
}


