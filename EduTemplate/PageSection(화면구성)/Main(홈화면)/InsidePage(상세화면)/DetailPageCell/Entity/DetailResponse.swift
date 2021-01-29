//
//  DetailResponse.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/11.
//

import Foundation

struct DetailResponse: Decodable {
    let result: DetailResult
    let isSuccess: Bool
    let code : Int
    let message : String
}

struct DetailResult: Decodable {
    let productIdx: Int
    let productName: String
    let sellerIdx: Int
    let sellerName: String
    let sellerProfileImageUrl: String
    let originalPrice: Int
    let discount: Int?
    let finalPrice: String
    let deliveryFee: Int?
    let freeDeliveryCondition: Int?
    let startDeliveryAfter: Int
    let quantity: Int
    let productInfo: String
    let category: String
    let productionPolicy: String
    let refundPolicy: String
    let points: Int?
    let rate: Int?
    let reviewNum: Int?
    let orderNum: Int?
    let viewNum: Int?
    let starredNum: Int?
    let isStarredByMe: Int
    let productImageUrl: [ProductImageUrl]
}


struct ProductImageUrl: Decodable {
    let imageUrl: String?
}
