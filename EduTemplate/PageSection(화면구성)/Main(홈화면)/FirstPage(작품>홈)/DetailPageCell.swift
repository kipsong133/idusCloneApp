//
//  DetailPageCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/07.
//

import UIKit

// 셀 내용.
class DetailPageCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var sellerProfileImageView: UIImageView!
    @IBOutlet weak var productnameLabel: UILabel!
    @IBOutlet weak var sellernameLabel: UILabel!
    @IBOutlet weak var dividingLineImageView: UIImageView!
    @IBOutlet weak var reviewnameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.backgroundColor = .white
        
        mainView.cornerRadius = CGFloat(5)
        mainView.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mainView.borderWidth = 1
    }
    
    
    
    
    
}
