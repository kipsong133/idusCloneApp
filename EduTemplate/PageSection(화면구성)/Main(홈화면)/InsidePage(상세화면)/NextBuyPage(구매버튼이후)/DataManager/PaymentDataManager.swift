//
//  PaymentDataManager.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/13.
//

import Alamofire

class PaymentDataManager {
    func postSignIn(_ parameters: PaymentInInput, viewController: NextBuyPageViewController) {
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request("\(Constant.BASE_URL)/orders/1", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: header)
            .validate()
            .responseDecodable(of: PaymentResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess, let result = response.message {
                        viewController.didSuccessPayment(result)

                    } else {
                        viewController.failedToRequest(message: response.message!)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }

}
