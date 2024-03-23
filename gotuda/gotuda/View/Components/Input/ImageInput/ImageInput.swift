//
//  ImageInout.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 23.03.2024.
//

import SwiftUI

struct ImageInput: View {
    private let isRequired: Bool
    
    init(isRequired: Bool = false) {
        self.isRequired = isRequired
    }
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            InputHeader(title: "Аватарка", isRequired: isRequired)
            
            InputSubheader("Выбери фото из галереи")
            
            ImageInputField()
            
        }.padding([.leading, .trailing], 30)
            .padding([.top, .bottom], 10)
    }
}



#Preview {
    ImageInput()
}



