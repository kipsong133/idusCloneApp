//
//  PresentViewController.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/14.
//

import UIKit

class PresentViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "뒤로가기버튼"), style: .plain, target: self, action: #selector(dummy))
        
    }


    @objc func dummy() {
        navigationController?.popViewController(animated: true)
    }

}
