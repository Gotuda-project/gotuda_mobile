import SwiftUI

struct InputView: View {
    private let title: String
    private let subtitle: String?
    private let inputMock: String
    private let isRequired: Bool
    @Binding private var input: String
    
    init(
        title: String,
        subtitle: String?,
        inputMock: String,
        isRequired: Bool = false,
        input: Binding<String> = .constant("")
    ) {
        self.title = title
        self.subtitle = subtitle
        self.inputMock = inputMock
        self.isRequired = isRequired
        self._input = input
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text(title)
                    .font(.montserrat(.bold, size: 16))
                if isRequired {
                    Text("*")
                        .font(.montserrat(.bold, size: 16))
                        .foregroundStyle(.red)
                }
            }
//            Spacer()
            if let subtitle {
                InputSubheader(subtitle)
            } else {
                Spacer()
            }
            TextField(inputMock, text: $input)
                .textFieldStyle(OvalTextFieldStyle()).textContentType(.oneTimeCode)
        }.padding([.leading, .trailing], 30)
            .padding([.top, .bottom], 10)
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .font(.montserrat(.regular, size: 14))
            .shadow(color: .gray.opacity(0.5), radius: 5, y: 5)
    }
}

#Preview {
    InputView(title: "Имя", subtitle: "Введи свое имя", inputMock: "Иван", isRequired: true
    )
}
