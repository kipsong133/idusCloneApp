//
//  MyProfileViewController.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/07.
//

import UIKit

class MyProfileViewController: BaseViewController {
  
    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var myProfileTitleLabel: UILabel = {
        
       let lb = UILabel()
        lb.text = "내 정보"
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.textColor = .black
        return lb
    }()
    
    var titleView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        configureNavi()
        
        let mainCellNibName = UINib(nibName: "AfterLoginTableViewCell", bundle: nil)
        tableView.register(mainCellNibName, forCellReuseIdentifier: "AfterLoginTableViewCell")
        
        // Section 2: 선물함
        let defaultNibName = UINib(nibName: "DetailMyProfileViewCell", bundle: nil)
        tableView.register(defaultNibName, forCellReuseIdentifier: "DetailMyProfileViewCell")

        // Section 2: VIP 클럽 VIPClubTableViewCell
        let VIPCellNibName = UINib(nibName: "VIPClubTableViewCell", bundle: nil)
        tableView.register(VIPCellNibName, forCellReuseIdentifier: "VIPClubTableViewCell")
        
        // Section 2: 친구 초대 
        let friendCellNibName = UINib(nibName: "InvitingFriendTableViewCell", bundle: nil)
        tableView.register(friendCellNibName, forCellReuseIdentifier: "InvitingFriendTableViewCell")
        
        // Section 3: 광고배너
        let adBannerCellNibName = UINib(nibName: "AdBannerTableViewCell", bundle: nil)
        tableView.register(adBannerCellNibName, forCellReuseIdentifier: "AdBannerTableViewCell")
        
        // Section 4: 최근 본 작품 ReccentWatchTableViewCell
        let ReccentWatchCellNibName = UINib(nibName: "ReccentWatchTableViewCell", bundle: nil)
        tableView.register(ReccentWatchCellNibName, forCellReuseIdentifier: "ReccentWatchTableViewCell")
        
        // Section 5: 공지사항, 이벤트, 자주묻는 질문
        let NotiCellNibName = UINib(nibName: "NotiTableViewCell", bundle: nil)
        tableView.register(NotiCellNibName, forCellReuseIdentifier: "NotiTableViewCell")
        
        let eventCellNibName = UINib(nibName: "eventTableViewCell", bundle: nil)
        tableView.register(eventCellNibName, forCellReuseIdentifier: "eventTableViewCell")
        
        let QnACellNibName = UINib(nibName: "QnATableViewCell", bundle: nil)
        tableView.register(QnACellNibName, forCellReuseIdentifier: "QnATableViewCell")
        
        // Section 6: About idus 
        let AboutidusCellNibName = UINib(nibName: "AboutidusTableViewCell", bundle: nil)
        tableView.register(AboutidusCellNibName, forCellReuseIdentifier: "AboutidusTableViewCell")
    }

    
    //MARK: - Action
    
    @objc func dummy() {
        
    }
    
    
    //MARK: - Helpers
    
    func configureNavi() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "내정보텍스트"), style: .plain, target: self, action: #selector(dummy))
        
        let cartIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "25픽셀카트아이콘"), style: .plain, target: self, action: #selector(dummy))
        let bellIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "22픽셀종아이콘"), style: .plain, target: self, action: #selector(dummy))
        let messageIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "22픽셀대화아이콘"), style: .plain, target: self, action: #selector(dummy))

        navigationItem.rightBarButtonItems = [cartIcon, bellIcon, messageIcon]
        
    }
    
}  
    
    
    
extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3 
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 3
        } else {
            return 1
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            // 내 정보 메인 Cell
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AfterLoginTableViewCell", for: indexPath) as! AfterLoginTableViewCell
                cell.selectionStyle = .none
                return cell
            default:
                return UITableViewCell()
            }
            
        } else if indexPath.section == 1 {
            // 선물함, VIP 클럽, 친구 초대
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailMyProfileViewCell", for: indexPath) as! DetailMyProfileViewCell
                cell.selectionStyle = .none
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "VIPClubTableViewCell", for: indexPath) as! VIPClubTableViewCell
                cell.selectionStyle = .none

                return cell
            default: // InvitingFriendTableViewCell
                let cell = tableView.dequeueReusableCell(withIdentifier: "InvitingFriendTableViewCell", for: indexPath) as! InvitingFriendTableViewCell
                cell.selectionStyle = .none

                return cell
            }
            
        } else if indexPath.section == 2 {
            // 광고배너
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AdBannerTableViewCell", for: indexPath) as! AdBannerTableViewCell
                cell.selectionStyle = .none

                return cell
            default:
                return UITableViewCell()
            }
            
        } else if indexPath.section == 3 {
            // 최근 본 작품
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReccentWatchTableViewCell", for: indexPath) as! ReccentWatchTableViewCell
                cell.selectionStyle = .none

                return cell
            default:
                return UITableViewCell()
            }
            
        } else if indexPath.section == 4 {
            // 공지사항, 이벤트, 자주 묻는 질문/고객센터
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotiTableViewCell", for: indexPath) as! NotiTableViewCell
                cell.selectionStyle = .none
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "eventTableViewCell", for: indexPath) as! eventTableViewCell
                cell.selectionStyle = .none
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "QnATableViewCell", for: indexPath) as! QnATableViewCell
                cell.selectionStyle = .none
                return cell
            }
            
        } else{
            // About idus
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AboutidusTableViewCell", for: indexPath) as! AboutidusTableViewCell
                cell.selectionStyle = .none
                return cell
            default:
                return UITableViewCell()
            }
            
        }

    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                return 260
            default :
                return 44
            }
            
        } else if indexPath.section == 1 {
            return 55
            
        } else if indexPath.section == 2 {
            return 63
            
        } else if indexPath.section == 3 {
            return 200
            
        } else if indexPath.section == 4 {
            return 55
            
        } else { 
            return 55
        }
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                // 선물함.
                self.navigationController?.pushViewController(PresentViewController(), animated: true)
                
            } else if indexPath.row == 1 {
                // VIP 클럽
                self.navigationController?.pushViewController(VIPClubVC(), animated: true)
                
            } else if indexPath.row == 2 {
                // 친구 초대
                self.navigationController?.pushViewController(InvitingVC(), animated: true)
                
            }
            
        } else if indexPath.section == 3 {
            // 최근 본 작품
            self.navigationController?.pushViewController(RecentVC(), animated: true)
            
        }
    }
    
    
    

}
