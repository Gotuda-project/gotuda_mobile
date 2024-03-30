//
//  RegisterByPhoneRequest.swift
//  gotuda
//
//  Created by Ekaterina Grigorenko on 30.03.2024.
//

import Foundation
import ObjectMapper

struct RegisterByPhoneRequest {
    var firstName: String?
    var lastName: String?
    var birthdate: String?
    var email: String = ""
    var phoneNumber: String?
    var password: String?
    var confirmationPhoneToken: String?
}

extension RegisterByPhoneRequest: Mappable {
    
    init(
        firstName: String,
        lastName: String,
        birthdate: String,
        phoneNumber: String,
        password: String,
        confirmationPhoneToken: String
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
        self.email = ""
        self.phoneNumber = phoneNumber
        self.password = password
        self.confirmationPhoneToken = confirmationPhoneToken
    }
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        birthdate <- map["birthdate"]
        email <- map["email"]
        phoneNumber <- map["phone_number"]
        password <- map["password"]
        confirmationPhoneToken <- map["confirmation_phone_token"]
    }
}
