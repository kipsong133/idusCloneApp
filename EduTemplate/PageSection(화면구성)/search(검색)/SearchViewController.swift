//
//  SearchViewController.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/07.
//

import UIKit

class SearchViewController: BaseViewController {

    override func viewDidLoad() {
        let nextVC = SearchPageVC()
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)    
    }



}
