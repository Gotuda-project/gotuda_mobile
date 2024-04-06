import SwiftUI
import ReSwift


struct RegistrationPhoneView: View {
    @EnvironmentObject var store: AppStore
    
    @State private var phone: String = ""
    @State private var password: String = ""
    
    @Binding private var currentScreen: RegistrationView.ScreenType
    init(currentScreen: Binding<RegistrationView.ScreenType>) {
        self._currentScreen = currentScreen
    }
    var body: some View {
        ScrollView {
            PhoneInputView(
                title: "Номер телефона",
                subtitle: "На который придет SMS с кодом",
                inputMock: "+7 (912) 345-67-89",
                input: $phone
            )
            Spacer()
        }
        LargeButton(title: "Отправить код") {
            RegisterService.shared.sendCode(phone: phone) { token in
                if let token {
                    self.store.dispatch(RegistrationAction.setTokenForConfirm(token))
                    self.store.dispatch(RegistrationAction.setPhoneNumber(phone))
                    self.currentScreen = .code
                }
            }
            
        }.padding([.leading, .trailing], 30)
    }
}
