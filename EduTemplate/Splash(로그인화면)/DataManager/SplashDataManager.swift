//
//  SplashDataManager.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/11.
//

import Alamofire

class SplashDataManager {
    func postSignIn(_ parameters: SplashInInput, viewController: SplashViewController) {
        AF.request("\(Constant.BASE_URL)/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: SplashResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess, let result = response.result {
                        viewController.didSuccessLogin(result)

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
