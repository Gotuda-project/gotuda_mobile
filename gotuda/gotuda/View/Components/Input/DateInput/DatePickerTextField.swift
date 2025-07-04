//
//  DatePickerTextField.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 23.03.2024.
//

import SwiftUI

struct DatePickerTextField: UIViewRepresentable {
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    private let helper = Helper()
    private let dateFormatter = DateFormatter()
    
    public var placeholder: String
    @Binding public var date: Date?
    public var datePickerMode: UIDatePicker.Mode
    public var dateFormat: String
    
    init(placeholder: String, date: Binding<Date?>, datePickerMode: UIDatePicker.Mode, dateFormat: String) {
        self.placeholder = placeholder
        self._date = date
        self.datePickerMode = datePickerMode
        self.dateFormat = dateFormat
        dateFormatter.dateFormat = dateFormat
    }
    
    func makeUIView(context: Context) -> UITextField {
        datePicker.datePickerMode = datePickerMode
        datePicker.preferredDatePickerStyle = .wheels
        if datePickerMode == .dateAndTime {
            datePicker.minimumDate = Date()
        }
        datePicker.addTarget(helper, action: #selector(helper.dateValueChanged), for: .valueChanged)
        textField.font = UIFont(name: "Montserrat-Regular", size: 14)
        
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowRadius = 5
        textField.layer.shadowOpacity = 5
        textField.placeholder = placeholder
        textField.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: helper, action: #selector(helper.doneButtonAction))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        self.textField.inputAccessoryView = toolbar
        
        helper.dateChanged = {
            self.date = datePicker.date
        }
        
        helper.doneButtonTapped = {
            if date == nil {
                date = datePicker.date
            }
            textField.resignFirstResponder()
        }
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if let selectedDate = self.date {
            uiView.text = dateFormatter.string(from: selectedDate)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Helper {
        public var dateChanged: (() -> Void)?
        public var doneButtonTapped: (() -> Void)?
        
        @objc func dateValueChanged() {
            self.dateChanged?()
        }
        
        @objc func doneButtonAction() {
            self.doneButtonTapped?()
        }
    }
    
    class Coordinator {
        
    }
}
