//
//  SettingViewController.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/13.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9686104655, green: 0.9685804248, blue: 0.9728260636, alpha: 1)

        
        let backBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "뒤로가기버튼"), style: .plain, target: self, action: #selector(back))
        
        let title = UIBarButtonItem(image: #imageLiteral(resourceName: "내정보텍스트"), style: .plain, target: self, action: #selector(dummy))
        
        navigationItem.leftBarButtonItems = [backBtn, title]
    }

    
    //MARK: - Action
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dummy() {
        
    }

    

}
