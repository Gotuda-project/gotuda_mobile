import SwiftUI

struct RegistrationCreateUserView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var birthday: Date = Date()
    
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
                    birthdate: birthday,
                    isRequired: true
                )
                
                ImageInput()
                Spacer()
                
            }
            Group {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                    LargeButton(title: "Далее") {
                    }.padding([.leading, .trailing], 30)
                }
            }
        }
        
        
    }
}

#Preview {
    RegistrationCreateUserView()
}
