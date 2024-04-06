import SwiftUI

struct RegistrationCodeView: View {
    @EnvironmentObject var store: AppStore
    @Binding private var currentScreen: RegistrationView.ScreenType
    
    init(currentScreen: Binding<RegistrationView.ScreenType>) {
        self._currentScreen = currentScreen
    }
    
    var body: some View {
        ScrollView {
            Spacer()
            CodeInput() { code in
                RegisterService.shared.confirmCode(request: ConfirmCodeRequest(code: code, token: store.state.tokenForConfirm)) { token in
                    if let token {
                        self.store.dispatch(RegistrationAction.setConfirmationPhoneToken(token))
                        self.currentScreen = .form
                    }
                }
            }
        }
        
    }
}
