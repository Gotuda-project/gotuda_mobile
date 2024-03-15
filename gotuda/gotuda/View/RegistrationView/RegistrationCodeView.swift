import SwiftUI

struct RegistrationCodeView: View {
    
    @Binding private var currentScreen: RegistrationView.ScreenType
    
    init(currentScreen: Binding<RegistrationView.ScreenType>) {
        self._currentScreen = currentScreen
    }
    
    var body: some View {
        ScrollView {
            Spacer()
            CodeInput() { code in
                // verification
                print(code)
                DispatchQueue.main.async {
                    if true {
                        currentScreen = .form
                    } else {
                        currentScreen = .code
                    }
                }
            }
        }
        
    }
}
