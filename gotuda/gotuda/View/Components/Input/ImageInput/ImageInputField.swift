//
//  ImageInputField.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 23.03.2024.
//

import SwiftUI

struct ImageInputField: View {
    
    @State var image = UIImage()
    @State var isPickerShow = false

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Button {
                isPickerShow.toggle()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25).stroke(Color.white, lineWidth: 3))
                        .opacity(0.5)
                    Image(systemName: "camera.fill")
                        .foregroundColor(.white)
                }
            }.sheet(isPresented: $isPickerShow) {
                ImagePicker(image: $image)
            }
        }
    }
}

#Preview {
    ImageInputField()
}
