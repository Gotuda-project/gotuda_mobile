import SwiftUI

struct OneTimeCodeBoxes: View {
    
    @Binding var codeDict: [Int: String]
    @State var firstResponderIndex = 0
    var onCommit: (()->Void)?
    
    var body: some View {
        HStack {
            ForEach(0..<codeDict.count) { i in
                let isEmpty = codeDict[i]?.isEmpty == true
                
                OneTimeCodeInput(
                    index: i,
                    codeDict: $codeDict,
                    firstResponderIndex: $firstResponderIndex,
                    onCommit: onCommit
                )
                .aspectRatio(1, contentMode: .fit)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: isEmpty ? 1 : 2)
                            .foregroundColor(isEmpty ? .secondary : .gray))
                .frame(width: 40, height: 50)
            }
        }
    }
}

struct OneTimeCodeBoxes_Previews: PreviewProvider {
    static var previews: some View {
        OneTimeCodeBoxes(codeDict: .constant([0: "", 1: "", 2: "", 3: ""]))
            .padding()
            .previewLayout(.sizeThatFits)
        
        OneTimeCodeBoxes(codeDict: .constant([0: "1", 1: "2", 2: ""]))
            .preferredColorScheme(.dark)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
