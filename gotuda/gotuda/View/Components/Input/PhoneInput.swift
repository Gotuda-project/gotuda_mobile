import SwiftUI
import iPhoneNumberField

struct PhoneInputView: View {
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
            if let subtitle {
                InputSubheader(subtitle)
            } else {
                Spacer()
            }
            iPhoneNumberField(text: $input)
                .flagHidden(true)
                .defaultRegion("RU")
                .prefixHidden(false)
                .autofillPrefix(true)
                .maximumDigits(10)
                .textFieldStyle(OvalTextFieldStyle()).textContentType(.oneTimeCode)
        }.padding([.leading, .trailing], 30)
            .padding([.top, .bottom], 10)
    }
}
