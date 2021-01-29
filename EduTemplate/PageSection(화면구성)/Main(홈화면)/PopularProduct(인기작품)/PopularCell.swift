//
//  PopularCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/10.
//

import UIKit

class PopularCell: UICollectionViewCell {

   
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewContents: UILabel!
    @IBOutlet weak var rating: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.cornerRadius = CGFloat(5)
        view.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.borderWidth = 1    
        
    }

}
