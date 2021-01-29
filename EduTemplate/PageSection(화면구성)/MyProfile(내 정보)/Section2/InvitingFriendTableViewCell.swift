//
//  InvitingFriendTableViewCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/10.
//

import UIKit

class InvitingFriendTableViewCell: UITableViewCell {

    @IBOutlet weak var eventNotiLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        eventNotiLabel?.text = "친구에게 5,000원 선물하고,\n5,000원 받으세요!"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
