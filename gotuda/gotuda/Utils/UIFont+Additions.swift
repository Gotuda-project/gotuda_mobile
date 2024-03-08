import UIKit

extension UIFont {
    
    enum Montserrat: String {
        case boldItalic = "Montserrat-BoldItalic"
        case light = "Montserrat-Light"
        case medium = "Montserrat-Medium"
        case italic = "Montserrat-Italic"
        case bold = "Montserrat-Bold"
        case thin = "Montserrat-Thin"
    }
    
    class func montserrat(name: Montserrat, size fontSize: CGFloat) -> UIFont {
        UIFont(name: name.rawValue, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}
