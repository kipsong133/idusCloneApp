//
//  CategoryCustomCell01.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/11.
//

import UIKit

class CategoryCustomCell01: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pagename: UILabel!
    
    
    override var isSelected: Bool {
        didSet{
            print("Changed")
            self.pagename.textColor = isSelected ? .mainOrange : .lightGray
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        pagename.textColor = .lightGray
    }
}
