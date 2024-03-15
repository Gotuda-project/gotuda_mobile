import SwiftUI

struct RegistrationPhoneView: View {
    @State private var phone: String = ""
    @State private var password: String = ""
    
    @Binding private var currentScreen: RegistrationView.ScreenType
    init(currentScreen: Binding<RegistrationView.ScreenType>) {
        self._currentScreen = currentScreen
    }
    var body: some View {
        ScrollView {
            InputView(
                title: "Номер телефона",
                subtitle: "На который придет SMS с кодом",
                inputMock: "+7 (912) 345-67-89",
                input: $phone
            )
            Spacer()
        }
        LargeButton(title: "Отправить код") {
            self.currentScreen = .code
        }.padding([.leading, .trailing], 30)
    }
}
