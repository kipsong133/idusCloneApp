//
//  SplashViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/10.
//

import UIKit
import FBSDKLoginKit

// 이곳에 로그인화면을 구성할 것
class SplashViewController: UIViewController,LoginButtonDelegate {

    

    
    //MARK: - Outlet
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var dividingLineImageView: UIImageView!
    @IBOutlet weak var memberLoginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var anotherRegistration: UILabel!
    
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        configureButton()
        configureUI()
        facebookLoginSetting()
 
    }
    
 
    
    
    
    
    //MARK: - Helpers
    
    func configureLabel() {
        
        let attributedStr = NSMutableAttributedString(string: warningLabel.text!)
        attributedStr.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: (warningLabel.text! as NSString).range(of:"이용약관"))
        attributedStr.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: (warningLabel.text! as NSString).range(of:"개인정보 처리방침"))

        attributedStr.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor.white, range: (warningLabel.text! as NSString).range(of:"이용약관"))
        attributedStr.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor.white, range: (warningLabel.text! as NSString).range(of:"개인정보 처리방침"))

        warningLabel.attributedText = attributedStr
    }
    
    func configureButton() {
        appleLoginBtn.cornerRadius = CGFloat(17)
        memberLoginBtn.cornerRadius = CGFloat(17)
        
        appleLoginBtn.borderWidth = 2
        appleLoginBtn.borderColor = .white
        
        memberLoginBtn.borderWidth = 2
        memberLoginBtn.borderColor = .white
         

    }
    
    
    func configureUI() {
        
        mainImageView.cornerRadius = CGFloat(20)
    }
    
    
    
    func facebookLoginSetting() {

        let loginButton = FBLoginButton()
        loginButton.delegate = self
        loginButton.permissions = ["public_profile", "email"]

        
        loginButton.frame.size = CGSize(width: appleLoginBtn.frame.width-20,
                                        height: appleLoginBtn.frame.height)
        loginButton.frame.origin = CGPoint(x: appleLoginBtn.frame.minX-10, y: anotherRegistration.frame.minY - 70)
        loginButton.cornerRadius = CGFloat(17)
        loginButton.borderWidth = 2
        loginButton.borderColor = .white

        view.addSubview(loginButton)
        
        if let token = AccessToken.current,
           !token.isExpired {
            print("DEBUG: token is \(token.tokenString)")
            Constant.accessToken = token.tokenString
            print(Constant.accessToken)
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                     parameters: ["fields":"email"],
                                                     tokenString: token,
                                                     version: nil,
                                                     httpMethod: .get)
            request.start { (connection, result, error) in
                print("\(result)")
                
//                self.changeRootViewController(BaseTabBarController())
            }
        }
        else {
            
        }
    }
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                 parameters: ["fields":"email, name"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        request.start { (connection, result, error) in
            print("\(result)")
            self.present(RegistrationViewController(), animated: true, completion: nil)
        }
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        //
    }
    
    
    
    
    @IBAction func mainButtonTapped(_ sender: UIButton) {
        self.changeRootViewController(BaseTabBarController())
    }
    
    @IBAction func alreadyMemberLogin(_ sender: Any) {
        // 이걸 로그인 API로 변경할 것.
        let input = SplashInInput(access_token: Constant.accessToken)
        SplashDataManager().postSignIn(input, viewController: self)
    }
    
    
    
    
    
    
}


extension SplashViewController {
    func didSuccessLogin(_ result: SplashResult) {
 
            Constant.jwtToken = result.jwt
            self.changeRootViewController(BaseTabBarController())

    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
