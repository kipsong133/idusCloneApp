//
//  TossTableViewCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/13.
//

import UIKit

class TossTableViewCell: UITableViewCell {

    @IBOutlet weak var btnOutlet: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btn(_ sender: Any) {
        if btnOutlet.isSelected {
            btnOutlet.isSelected = false
        }else {
            btnOutlet.isSelected = true
        }
    }
    
    
}
