//
//  PaymentTableViewCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/12.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var usingBtn: UIButton!
    @IBOutlet weak var pointLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        textField.borderWidth = 1
        textField.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        textField.cornerRadius = CGFloat(5)
        
        usingBtn.cornerRadius = CGFloat(5)
        usingBtn.backgroundColor = #colorLiteral(red: 1, green: 0.5323386788, blue: 0.2636727989, alpha: 1)
        
        let attributedStr = NSMutableAttributedString(string: pointLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainOrange, range: (pointLabel.text! as NSString).range(of: "280P"))
        pointLabel.attributedText = attributedStr

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
