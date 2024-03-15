import SwiftUI

struct NavigationButton: View {
    
    // MARK: Private properties
    
    private static let buttonHorizontalMargins: CGFloat = 30
    
    var backgroundColor: Color
    var foregroundColor: Color
    private let action: () -> Void
    
    private let title: String
    
    private let disabled: Bool
    
    // MARK: Initialize
    
    init(title: String,
         disabled: Bool = false,
         backgroundColor: Color = Color.black,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void = {}) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.disabled = disabled
        self.action = action
    }
    
//    var body: some View {
//    
//        Button(action:self.action) {
//                Text(self.title)
//                    .frame(maxWidth:.infinity)
//                    .frame(height: 55)
//            
//                
//        }
//        .buttonStyle(LargeButtonStyle(backgroundColor: backgroundColor,
//                                      foregroundColor: foregroundColor,
//                                      isDisabled: disabled))
//        .disabled(self.disabled)
//    }
    
    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(50)
                
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(foregroundColor, lineWidth: 1)
            )
                .font(.montserrat(.bold, size: 16))
            Spacer()
        }
        
            
    }
}

struct LargeButton: View {
    
    // MARK: Private properties
    
    private static let buttonHorizontalMargins: CGFloat = 30
    
    var backgroundColor: Color
    var foregroundColor: Color
    private let action: () -> Void
    
    private let title: String
    
    private let disabled: Bool
    
    // MARK: Initialize
    
    init(title: String,
         disabled: Bool = false,
         backgroundColor: Color = Color.black,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void = {}) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.disabled = disabled
        self.action = action
    }
    
    var body: some View {

        Button(action:self.action) {
                Text(self.title)
                    .frame(maxWidth:.infinity)
                    .frame(height: 55)


        }
        .buttonStyle(LargeButtonStyle(backgroundColor: backgroundColor,
                                      foregroundColor: foregroundColor,
                                      isDisabled: disabled))
        .disabled(self.disabled)
    }
}
