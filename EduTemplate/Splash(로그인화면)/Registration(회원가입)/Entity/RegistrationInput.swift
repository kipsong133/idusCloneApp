//
//  RegistrationInput.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/09.
//

struct RegistrationInInput: Encodable {
    var userName: String
    var referenceCode: String?
    var email: String
    var mobileNo: String
    var access_token: String
    
}
