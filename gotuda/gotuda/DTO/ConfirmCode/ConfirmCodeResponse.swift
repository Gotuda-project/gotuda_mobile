import Foundation
import ObjectMapper

struct ConfirmCodeResponse {
    var confimationPhoneToken: String?
}

extension ConfirmCodeResponse: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        confimationPhoneToken <- map["confirmation_phone_token"]
    }
}
