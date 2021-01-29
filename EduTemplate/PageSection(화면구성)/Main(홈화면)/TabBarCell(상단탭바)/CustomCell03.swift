//
//  CustomCell03.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/07.
//

import UIKit

class CustomCell03: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pagename: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pagename.textColor = .lightGray
    }
    override var isSelected: Bool {
        didSet{
            print("Changed")
            self.pagename.textColor = isSelected ? .mainOrange : .lightGray
        }
    }
}
