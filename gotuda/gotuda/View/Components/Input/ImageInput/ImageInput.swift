//
//  ImageInout.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 23.03.2024.
//

import SwiftUI

struct ImageInput: View {
    private let isRequired: Bool
    @Binding var image: UIImage?
    
    init(isRequired: Bool = false, image: Binding<UIImage?>) {
        self.isRequired = isRequired
        self._image = image
    }
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            InputHeader(title: "Аватарка", isRequired: isRequired)
            
            InputSubheader("Выбери фото из галереи")
            
            ImageInputField(image: $image)
            
        }.padding([.leading, .trailing], 30)
            .padding([.top, .bottom], 10)
    }
}





