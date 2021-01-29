//
//  PopularProductDataManager.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/14.
//

import Foundation
import Alamofire

class PopularProductDataManager {
    func PopularProductDataList(PopularProductCell: PopularProductCell) {
        let url = "\(Constant.BASE_URL)/products/top"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MDgzMDk3MTUsImV4cCI6MTYzOTg0NTcxNSwidXNlcklkeCI6IjEzIn0.LRLz8rkLxD_ZvpFVxvxbsJyXcs87xItReFP5nJFrb-I"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: PopularProductResponse.self) { response in
                switch response.result {
                case .success(let response):
                    PopularProductCell.didRetrievePopularProduct(result: response.result)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    PopularProductCell.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
