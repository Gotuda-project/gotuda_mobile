//
//  LoginView.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 10.03.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var store: AppStore
    @State private var phone: String = ""
    @State private var password: String = ""
    var body: some View {
        ScrollView() {
            InputView(
                    title: "Номер телефона", subtitle: nil, inputMock: "+7 (912) 345-67-89", input: $phone
                )
            Spacer()
            SecureInputView("Пароль", text: $password)
        }
        NavigationButton(title: "Войти")
    }
}

#Preview {
    LoginView()
}
