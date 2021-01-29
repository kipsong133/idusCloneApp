//
//  DetailPopularSellerCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/11.
//

import UIKit

class DetailPopularSellerCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var sellerProfileImageView: UIImageView!

    @IBOutlet weak var productname: UILabel!
    @IBOutlet weak var productInfo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        view.cornerRadius = CGFloat(5)
//        view.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        view.borderWidth = 1 
        sellerProfileImageView.cornerRadius = CGFloat(sellerProfileImageView.frame.width/2)
        sellerProfileImageView.borderWidth = 0.5
        sellerProfileImageView.borderColor = .white
        
        productInfo.text = "real handmade item\n- 소유하고 싶은 아이템\n작가의 아이디어가 폭발했어요😉"
    }

}
