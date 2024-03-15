import SwiftUI

extension Font {
    enum MontserratFont {
        case boldItalic
        case bold
        case light
        case medium
        case italic
        case thin
        case regular
        case custom(String)
        
        var value: String {
            switch self {
            case .boldItalic:
                return "Montserrat-BoldItalic"
                
            case .bold:
                return "Montserrat-Bold"
                
            case .light:
                return "Montserrat-Light"
                
            case .medium:
                return "Montserrat-Medium"
                
            case .italic:
                return "Montserrat-Italic"
                
            case .thin:
                return "Montserrat-Thin"
                
            case .regular:
                return "Montserrat-Regular"
                
            case .custom(let name):
                return name
            }
        }
    }
    
    static func montserrat(_ type: MontserratFont, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
}
