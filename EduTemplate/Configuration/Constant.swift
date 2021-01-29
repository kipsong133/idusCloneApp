//
//  Constant.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import Alamofire

struct Constant {
    static let BASE_URL = "https://prod.idus11th.shop"
    static let KOBIS_BASE_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest"
    
    static var accessToken: String = "" 
    static var jwtToken: String = ""
    static var loginSuccessIndex: Int = 0
    static var mainSeletedCellIdx: Int = 0
}
