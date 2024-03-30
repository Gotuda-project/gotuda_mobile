import SwiftUI

struct RegistrationCreateUserView: View {
    @EnvironmentObject var store: AppStore
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var password: String = ""
    @State private var birthday: Date? = Date()
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            ScrollView {
                InputView(
                    title: "Имя",
                    subtitle: "Введи свое имя",
                    inputMock: "Иван",
                    isRequired: true,
                    input: $name
                )
                Spacer()
                InputView(
                    title: "Фамилия",
                    subtitle: "Введи свою фамилию",
                    inputMock: "Иванов",
                    isRequired: true,
                    input: $surname
                )
                DateInput(
                    birthdate: $birthday,
                    isRequired: true
                )
                
                SecureInputView("Пароль", text: $password)
                
                ImageInput(image: $image)
                Spacer()
                
            }
            Group {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                    LargeButton(title: "Далее") {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "dd.MM.yyyy"
                        let date = formatter.string(from: birthday ?? Date())
                        store.dispatch(makeRegister(request: RegisterByPhoneRequest(
                            firstName: name,
                            lastName: surname,
                            birthdate: date,
                            phoneNumber: store.state.phone?.digits,
                            password: password,
                            confirmationPhoneToken: store.state.confirmationPhoneToken
                        )))
                    }.padding([.leading, .trailing], 30)
                }
            }
        }
        
        
    }
}

#Preview {
    RegistrationCreateUserView()
}
