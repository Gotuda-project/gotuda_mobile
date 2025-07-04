//
//  PasswordInputView.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 10.03.2024.
//

import SwiftUI

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)

                } else {
                    TextField(title, text: $text)
                    
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
        .textFieldStyle(OvalTextFieldStyle())
        .padding([.leading, .trailing], 30)
        .padding([.top, .bottom], 10)
    }
}
#Preview {
    SecureInputView("Пароль", text: .constant(""))
}
