//
//  RealTimeResponse.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/13.
//

import Foundation
import BetterCodable

struct RealTimeResponse: Codable {
    let result: [RealTimeResult]
    let isSuccess: Bool
    let code : Int
    let message : String
}

struct RealTimeResult: Codable {
    let productIdx: Int
    let productName: String
    let productImageUrl: String
    let sellerIdx: Int
    let sellerName: String
    let isStarredByMe: Int?
    let review: [Review]
}

struct Review: Codable {
    let reviewIdx: Int
    let reviewerIdx: Int
    @DefaultEmptyString var reviewerName: String
    @DefaultEmptyString var ReviewContent: String
    let isReviewImageAttached: Int
    let rate: Int
  
}
