//
//  InputSubheader.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 23.03.2024.
//

import SwiftUI

struct InputSubheader: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .foregroundStyle(.gray)
            .font(.montserrat(.regular, size: 12))
            .padding([.bottom], 20)
    }
}

#Preview {
    InputSubheader("Введи дату своего рождения")
}
