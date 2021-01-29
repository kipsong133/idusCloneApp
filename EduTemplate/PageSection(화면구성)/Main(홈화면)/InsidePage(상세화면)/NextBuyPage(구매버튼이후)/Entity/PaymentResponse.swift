//
//  PaymentResponse.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/13.
//

import Foundation

struct PaymentResponse: Decodable {
    var code: Int
    var message: String?
    var isSuccess: Bool
}
