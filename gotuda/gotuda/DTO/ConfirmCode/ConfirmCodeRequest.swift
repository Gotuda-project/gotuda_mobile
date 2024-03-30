import Foundation
import ObjectMapper


struct ConfirmCodeRequest: Mappable {
    init?(map: ObjectMapper.Map) {
        code = ""
        token = ""
    }
    
    init(
        code: String?,
        token: String?
    ) {
        self.code = code
        self.token = token
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        code <- map["code"]
        token <- map["token_for_confirm_phone"]
    }
    
    var code: String?
    var token: String?
    
    
}

