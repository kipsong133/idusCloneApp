//
//  PageDataManager.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/10.
//

import Alamofire

class PageDataManager {
    func PageDataList(PageCell: PageCell) {
        let url = "\(Constant.BASE_URL)/products/home"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MDk5MDk0ODIsImV4cCI6MTY0MTQ0NTQ4MiwidXNlcklkeCI6IjE0In0.eDtApQXhdIi6JejhKYx_5RctUM-BCEHu2hI7WMBLkHE"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: PageResponse.self) { response in
                switch response.result {
                case .success(let response):
                    PageCell.didRetrieveBoxOffice(result: response)
                case .failure(let error):
                    print(error.localizedDescription)
                    PageCell.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
