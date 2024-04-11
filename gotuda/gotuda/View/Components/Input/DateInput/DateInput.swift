//
//  DateInput.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 23.03.2024.
//

import SwiftUI

struct DateInput: View {
    private let title: String
    private let subtitle: String
    private let placeholder: String
    @Binding private var birthdate: Date?
    private let isRequired: Bool
    private let dateFormat: String
    private let datePickerMode: UIDatePicker.Mode
    
    init(
        title: String,
        subtitle: String,
        placeholder: String,
        birthdate: Binding<Date?>,
        dateFormat: String,
        datePickerMode: UIDatePicker.Mode,
        isRequired: Bool = false
    ) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
        self.isRequired = isRequired
        self.dateFormat = dateFormat
        self.datePickerMode = datePickerMode
        self._birthdate = birthdate
    }
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            InputHeader(title: title, isRequired: isRequired)
            
            InputSubheader(subtitle)
            
            DatePickerTextField(
                placeholder: placeholder,
                date: $birthdate,
                datePickerMode: datePickerMode,
                dateFormat: dateFormat
            )
                .font(.montserrat(.regular, size: 14))
                .padding()
                .frame(height: 50)
                .background(RoundedRectangle(cornerRadius: 14).fill(Color.white).shadow(color: .gray.opacity(0.5), radius: 5, y: 5))
        }.padding([.leading, .trailing], 30)
            .padding([.top, .bottom], 10)
    }
}



