//
//  RegistrationViewController.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/08.
//

import UIKit

class RegistrationViewController: UIViewController {

    //MARK: - Outlet
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCorrectTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var chuchoninTextField: UITextField!
    @IBOutlet weak var completeBtn: UIButton!
    @IBOutlet weak var agreeView: UIView!
    
    // MARK: 동의버튼 Outlet
    @IBOutlet weak var agreeAllView: UIButton!
    @IBOutlet weak var firstAgreeOutlet: UIButton!
    @IBOutlet weak var secondAgreeOutlet: UIButton!
    @IBOutlet weak var thirdAgreeOutlet: UIButton!
    
    //MARK: - Action
 
    // MARK: 동의버튼 Action
    @IBAction func agreeAllBtn(_ sender: Any) {
        if agreeAllView.isSelected {
            agreeAllView.isSelected = false
            firstAgreeOutlet.isSelected = false
            secondAgreeOutlet.isSelected = false
            thirdAgreeOutlet.isSelected = false

        }else {
            agreeAllView.isSelected = true
            firstAgreeOutlet.isSelected = true
            secondAgreeOutlet.isSelected = true
            thirdAgreeOutlet.isSelected = true
        }
    }
    
    @IBAction func agreeFirstBtn(_ sender: Any) {
        if firstAgreeOutlet.isSelected {
            firstAgreeOutlet.isSelected = false
        }else {
            firstAgreeOutlet.isSelected = true
        }
    }
    
    @IBAction func agreeSecondBtn(_ sender: Any) {
        if secondAgreeOutlet.isSelected {
            secondAgreeOutlet.isSelected = false
        }else {
            secondAgreeOutlet.isSelected = true
        }
    }
    
    @IBAction func agreeThirdBtn(_ sender: Any) {
        if thirdAgreeOutlet.isSelected {
            thirdAgreeOutlet.isSelected = false
        }else {
            thirdAgreeOutlet.isSelected = true
        }
    }
    
    @IBAction func registrationBtn(_ sender: Any) {
        let input = RegistrationInInput(userName: "\(nameTextField.text ?? "김우노")",
                                        referenceCode: "\(emailTextField.text ?? "kipsong133@gmail.com")",
                                        email: "\(emailTextField.text ?? "kipsong133@gmail.com")",
                                        mobileNo: "\(phoneNumberTextField.text ?? "01012345678")",
                                        access_token: "\(Constant.accessToken)")
        RegistrationDataManager().postSignIn(input, viewController: self)
        
    }
    
    
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    //MARK: - Helpers
    
    func configureUI() {
        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "이름", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호 (영문+숫자+특수문자 8자 이상)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        passwordCorrectTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호 확인", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "전화번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        chuchoninTextField.attributedPlaceholder = NSAttributedString(string: "추천인코드 (선택사항)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        
        completeBtn.cornerRadius = CGFloat(17)
        completeBtn.borderWidth = 2
        completeBtn.borderColor = .white
        
        
        agreeView.cornerRadius = CGFloat(10)
        agreeView.borderWidth = 2
        agreeView.borderColor = .white
    }
    

}

extension RegistrationViewController {
    func didSuccessRegistration(_ result: Result) {
//        self.presentAlert(title: "로그인에 성공하였습니다", message: result.jwt) { (_) in
//        }
            Constant.jwtToken = result.jwt
            self.changeRootViewController(BaseTabBarController())

        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
