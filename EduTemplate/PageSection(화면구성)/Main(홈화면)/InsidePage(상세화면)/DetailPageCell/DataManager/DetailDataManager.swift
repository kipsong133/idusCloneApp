//
//  DetailDataManager.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/11.
//

import Alamofire

class DetailDataManager {
    func DetailDataList(vc: InsidePageViewController) {
        let url = "\(Constant.BASE_URL)/products/\(Constant.mainSeletedCellIdx)"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: DetailResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.didRetrieveDetail(result: response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
