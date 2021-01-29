//
//  CustomCell02.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/07.
//

import UIKit

class CustomCell02: UICollectionViewCell {
    //  실시간 후기

    //MARK: - Outlet
    
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
