//
//  PageResponse.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/10.
//

import Foundation

struct PageResponse: Codable {
    let result: [PageResult]
    let isSuccess: Bool
    let code : Int
    let message : String
}

struct PageResult: Codable {
    let productIdx: Int
    let productName: String
    let productImageUrl: String
    let sellerIdx: Int
    let sellerName: String
    let sellerProfileImageUrl: String
    let reviewerIdx: Int
    let reviewerName: String
    let reviewcontent: String
    let isReviewImageAttached: Int? 
    let rate: Int
    let isStarredByMe: Int?
}
