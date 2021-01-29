//
//  CustomCell.swift
//  sampleTabBar
//
//  Created by 김우성 on 2021/01/06.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    
  
    // 코드로 작성한 부분
    var label: UILabel = {
        let label = UILabel()
        label.text = "홈"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override var isSelected: Bool {
        didSet{
            print("Changed")
            self.label.textColor = isSelected ? .mainOrange : .lightGray
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
                self.addSubview(label)
                label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
                label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true 
    }
    
}
