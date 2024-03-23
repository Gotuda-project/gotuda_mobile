//
//  InputHeader.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 23.03.2024.
//

import SwiftUI

struct InputHeader: View {
    private let title: String
    private let isRequired: Bool
    
    init(title: String, isRequired: Bool) {
        self.title = title
        self.isRequired = isRequired
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .font(.montserrat(.bold, size: 16))
            if isRequired {
                Text("*")
                    .font(.montserrat(.bold, size: 16))
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    InputHeader(title: "Title", isRequired: true)
}
