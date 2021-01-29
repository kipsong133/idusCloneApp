//
//  AfterLoginTableViewCell.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/13.
//

import UIKit

class AfterLoginTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func orderShipmentBtn(_ sender: Any) {

        guard let topVC = UIApplication.shared.topViewController() else { return }
        topVC.navigationController?.pushViewController(OrderShipmentViewController(), animated: true)
        
    }
    
    @IBAction func settingBtn(_ sender: Any) {
        // 
        guard let topVC = UIApplication.shared.topViewController() else { return }
        topVC.navigationController?.pushViewController(SettingViewController(), animated: true)
    }
    
    @IBAction func favoriteBtn(_ sender: Any) {
        guard let topVC = UIApplication.shared.topViewController() else { return }
        topVC.navigationController?.pushViewController(FavoriteViewController(), animated: true)
    }
    
    
    @IBAction func favoriteAuthorBtn(_ sender: Any) {
        guard let topVC = UIApplication.shared.topViewController() else { return }
        topVC.navigationController?.pushViewController(FavoriteAuthorViewController(), animated: true)
    }
    
    
    
    
    
    
}
