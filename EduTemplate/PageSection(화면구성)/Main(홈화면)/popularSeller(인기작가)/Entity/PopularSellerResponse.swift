//
//  PopularSellerResponse.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/14.
//

import Foundation
import BetterCodable

struct PopularSellerResponse: Decodable {
    let result: [PopularSellerResult]
    let isSuccess: Bool
    let code : Int
    let message : String
}

struct PopularSellerResult: Decodable {
    let sellerIdx: Int
    let sellerName: String
    let sellerProfileImageUrl: String
    let sellerBackgroundImageUrl: String
    let bio: String?
    let isLikedByMe: Int
}


