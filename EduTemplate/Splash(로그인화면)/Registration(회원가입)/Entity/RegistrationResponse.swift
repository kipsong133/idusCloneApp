//
//  RegistrationResponse.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/09.
//

import Foundation

struct RegistrationResponse: Decodable {
    
    var result: Result?
    var code: Int
    var message: String
    var isSuccess: Bool
    
    

//    var result: RegistrationResult?
}

struct Result: Decodable {
    var jwt: String
    var userIdx: Int
}

