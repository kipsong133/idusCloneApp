//
//  PopularProduectResponse.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/14.
//

import Foundation
import BetterCodable

struct PopularProductResponse: Decodable {
    let result: [PopularProductResult]
    let isSuccess: Bool
    let code : Int
    let message : String
}

struct PopularProductResult: Decodable {
    let category: String
    let productInfo: [productInfo]
}


struct productInfo: Decodable {
    let productIdx: Int
    let productImageUrl: String
    let productName : String
    let sellerIdx: Int
    let sellerName: String
    let reviewIdx: Int
    let reviewerIdx: Int
    let reviewerName: String
    let reviewContent: String
    let isReviewImageAttached: Int?
    let rate: Int
    let isStarredByMe: Int
}
