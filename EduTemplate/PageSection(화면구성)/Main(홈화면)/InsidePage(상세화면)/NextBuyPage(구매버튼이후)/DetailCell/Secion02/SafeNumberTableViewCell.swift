//
//  SafeNumberTableViewCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/12.
//

import UIKit

class SafeNumberTableViewCell: UITableViewCell  {
    

    @IBOutlet weak var checkBoxOutlet: UIButton!
    
    override func awakeFromNib() {

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkBox(_ sender: Any) {
        if checkBoxOutlet.isSelected {
            checkBoxOutlet.isSelected = false
        } else {
            checkBoxOutlet.isSelected = true
        }
    }
}
