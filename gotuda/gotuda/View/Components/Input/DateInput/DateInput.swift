//
//  DateInput.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 23.03.2024.
//

import SwiftUI

struct DateInput: View {
    @Binding private var birthdate: Date?
    private let isRequired: Bool
    
    init(
        birthdate: Binding<Date?>,
        isRequired: Bool = false
    ) {
        self.isRequired = isRequired
        self._birthdate = birthdate
    }
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            InputHeader(title: "День рождения", isRequired: isRequired)
            
            InputSubheader("Введи дату своего рождения")
            
            DatePickerTextField(placeholder: "07.08.2003", date: $birthdate)
                .font(.montserrat(.regular, size: 14))
                .padding()
                .frame(height: 50)
                .background(RoundedRectangle(cornerRadius: 14).fill(Color.white).shadow(color: .gray.opacity(0.5), radius: 5, y: 5))
        }.padding([.leading, .trailing], 30)
            .padding([.top, .bottom], 10)
    }
}



