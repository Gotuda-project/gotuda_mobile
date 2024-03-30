//
//  SendCodeResponse.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 30.03.2024.
//

import Foundation
import ObjectMapper

struct SendCodeModel {
    var tokenForConfirm: String?
}

extension SendCodeModel: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        tokenForConfirm <- map["token_for_confirm_phone"]
    }
}
