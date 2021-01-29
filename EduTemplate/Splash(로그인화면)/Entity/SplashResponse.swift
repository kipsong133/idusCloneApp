//
//  SplashResponse.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/11.
//

import Foundation

struct SplashResponse: Decodable {
    
    var result: SplashResult?
    var code: Int
    var message: String
    var isSuccess: Bool
}

struct SplashResult: Decodable {
    
    var jwt: String
    var userIdx: Int
}
