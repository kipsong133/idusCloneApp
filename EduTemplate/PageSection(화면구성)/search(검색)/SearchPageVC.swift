//
//  SearchPageVC.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/11.
//

import UIKit

class SearchPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9686104655, green: 0.9685804248, blue: 0.9728260636, alpha: 1)
    }


    @IBAction func backBtn(_ sender: Any) {
//        self.changeRootViewController(BaseTabBarController())
        self.dismiss(animated: true) { 
                    self.changeRootViewController(BaseTabBarController())
        }
    }
    

}
