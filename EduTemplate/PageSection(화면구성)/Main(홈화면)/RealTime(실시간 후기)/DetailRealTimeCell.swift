//
//  DetailRealTimeCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/10.
//

import UIKit

class DetailRealTimeCell: UICollectionViewCell {

    //MARK: - Outlet
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var reviewername01: UILabel!
    @IBOutlet weak var review01: UILabel!
    @IBOutlet weak var reviewer02: UILabel!
    @IBOutlet weak var review02: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.cornerRadius = CGFloat(5)
        mainView.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mainView.borderWidth = 1
    }

}
