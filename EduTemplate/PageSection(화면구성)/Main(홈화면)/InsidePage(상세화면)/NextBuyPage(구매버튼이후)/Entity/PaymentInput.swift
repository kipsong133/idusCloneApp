//
//  PaymentInput.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/13.
//

import Foundation

struct PaymentInInput: Encodable {

    var addressIdx : Int
    var receiverName : String
    var mobileNo : String
    var address : String
    var supportSeller : Int
    var paymentMethod : Int
    var useTmpMobileNo : Int
    var optionIdx : [Int]
    var detailedOptionIdx : [Int]
    
}
