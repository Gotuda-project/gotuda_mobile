//
//  RegisterByPhoneResponse.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 30.03.2024.
//

import Foundation
import ObjectMapper

struct RegisterByPhoneResponse {
    var firstName: String?
    var lastName: String?
    var birthdate: Date?
    var token: String?
}

extension RegisterByPhoneResponse: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        birthdate <- map["birthdate"]
        token <- map["token"]
    }
}
