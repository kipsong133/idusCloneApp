//
//  PopularSellerDataManager.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/14.
//

import Foundation
import Alamofire

class PopularSellerDataManager {
    func PopularSellerDataList(PopularSellerCell: PopularSellerCell) {
        let url = "\(Constant.BASE_URL)/sellers/top"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MDk5MDk0ODIsImV4cCI6MTY0MTQ0NTQ4MiwidXNlcklkeCI6IjE0In0.eDtApQXhdIi6JejhKYx_5RctUM-BCEHu2hI7WMBLkHE"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: PopularSellerResponse.self) { response in
                switch response.result {
                case .success(let response):
                    PopularSellerCell.didRetrievePopularSeller(result: response.result)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    PopularSellerCell.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
