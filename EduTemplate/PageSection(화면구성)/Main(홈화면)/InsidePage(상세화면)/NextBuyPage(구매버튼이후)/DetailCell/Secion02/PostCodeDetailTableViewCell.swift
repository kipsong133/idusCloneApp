//
//  PostCodeDetailTableViewCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/12.
//

import UIKit

class PostCodeDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var postCodeDetailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        postCodeDetailLabel.text = "03037\n서울특별시 북가좌동 증산로 99\n(백산동 타워펠리스)\n101동 1024호" 

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
