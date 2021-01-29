//
//  RegistrationDataManager.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/09.
//

import Alamofire

class RegistrationDataManager {
    func postSignIn(_ parameters: RegistrationInInput, viewController: RegistrationViewController) {
        AF.request("\(Constant.BASE_URL)/users", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: RegistrationResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess, let result = response.result {
                        viewController.didSuccessRegistration(result)

                    } else {
                        viewController.failedToRequest(message: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
