//
//  CodeInput.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 10.03.2024.
//

import SwiftUI

struct CodeInput: View {
    static let codeDigits = 4
    @State
    var codeDict: Dictionary<Int, String>
    var code: String {
            codeDict.sorted(by: { $0.key < $1.key }).map(\.value).joined()
        }
    private let onCommit: (String) -> Void
    
    init(onCommit: @escaping (String) -> Void) {
        codeDict = Dictionary<Int, String>(uniqueKeysWithValues: (0..<CodeInput.codeDigits).map{ ($0, "") })
        self.onCommit = onCommit
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer(minLength: 30)
                Text("Код")
                    .font(.montserrat(.bold, size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer(minLength: 10)
            HStack {
                Spacer(minLength: 30)
                Text("Код из SMS")
                    .foregroundStyle(.gray)
                    .font(.montserrat(.regular, size: 12))
                    .padding([.bottom], 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            OneTimeCodeBoxes(codeDict: $codeDict,
                             onCommit: {
                onCommit(code)
            })
            .onChange(of: codeDict) {}
            .padding()
        }
    }
}

#Preview {
    CodeInput(onCommit: {_ in })
}
