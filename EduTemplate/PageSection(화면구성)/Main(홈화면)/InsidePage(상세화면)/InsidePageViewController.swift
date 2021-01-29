//
//  InsidePageViewController.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/08.
//

import UIKit

class InsidePageViewController: BaseViewController  {

    

    //MARK: - Outlet
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buyBtnOutlet: UIButton!
    
    var detailData: DetailResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        self.tabBarController?.tabBar.isHidden = true
        DetailDataManager().DetailDataList(vc: self)

        
        // configureUI
        buyBtnOutlet.cornerRadius = CGFloat(5)
        
        tableView.delegate = self
        tableView.dataSource = self

        // Nib 파일 등록
        // 첫 번째 셀(이미지 및 작품정보)
        let defaultNibName = UINib(nibName: "DetailInsidePageCell", bundle: nil)
        tableView.register(defaultNibName, forCellReuseIdentifier: "DetailInsidePageCell")

        // 두번째 셀(배송관련정보)
        let secondSectionCellNibName = UINib(nibName: "DetailSection02TableViewCell", bundle: nil)
        tableView.register(secondSectionCellNibName, forCellReuseIdentifier: "DetailSection02TableViewCell")
        
        
        // 세번째 셀(작품내용) DescriptionTableViewCell
        let thirdSectionCellNibName = UINib(nibName: "DescriptionTableViewCell", bundle: nil)
        tableView.register(thirdSectionCellNibName, forCellReuseIdentifier: "DescriptionTableViewCell")
        
        // 네번째 셀(제작/배송, 교환/환불) shipmentTableViewCell
        let forthSectionCellNibName = UINib(nibName: "shipmentTableViewCell", bundle: nil)
        tableView.register(forthSectionCellNibName, forCellReuseIdentifier: "shipmentTableViewCell")
        
    }

    //MARK: - action
    
    @objc func searchSth() {
        
    }

    @objc func moveHome() {
//        navigationController?.popViewController(animated: true)
        changeRootViewController(BaseTabBarController())
    }
    
    @objc func moveCart() {
        
    }
    
    //MARK: - Helper
    
    func configureNavi() {
        navigationController?.hidesBarsOnSwipe = false
        let searchIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "검색"), style: .plain, target: self, action: #selector(searchSth))
        let homeIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "작품"), style: .plain, target: self, action: #selector(moveHome))
        let cartIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "25픽셀카트아이콘"), style: .plain, target: self, action: #selector(moveCart))
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "뒤로가기버튼"), style: .plain, target: self, action: #selector(moveHome))
        
        navigationItem.rightBarButtonItems = [ cartIcon, homeIcon,searchIcon]
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9557611346, green: 0.9558982253, blue: 0.9557310939, alpha: 1)

    }
    
    
    //MARK: - Action
    
    @IBAction func buyBtn(_ sender: Any) {
        
        let nextVC = BuyPageViewController()
        nextVC.modalPresentationStyle = .custom
        
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    
    
    
    
}








//MARK: - TableViewDelegateProtocol


extension InsidePageViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Cell 별로 다른 cell 부여
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailInsidePageCell", for: indexPath) as! DetailInsidePageCell
                cell.produectname.text = detailData?.productName
                
                if let uurl = detailData?.productImageUrl[0].imageUrl {
                    let mainImgUrl = URL(string: uurl)!
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: mainImgUrl) 
                        DispatchQueue.main.async {
                            guard let imgData = data else {return}
                            cell.produnctImageView.image = UIImage(data: imgData)
                        }
                    }
                    
                }
                

                
                return cell
            default:
                return UITableViewCell()
            }
            
            
        } else if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSection02TableViewCell", for: indexPath) as! DetailSection02TableViewCell
                return cell
            default:
                return UITableViewCell()
            }
            
        } else if indexPath.section == 2 {
            switch indexPath.row { //
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
                cell.lb.text = detailData?.productInfo
                return cell
            default:
                return UITableViewCell()
            }
            
        } else if indexPath.section == 3 {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "shipmentTableViewCell", for: indexPath) as! shipmentTableViewCell
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "shipmentTableViewCell", for: indexPath) as! shipmentTableViewCell
                return cell
            }
        }
        
        
        
        
        
        
        
        
        
        
        return UITableViewCell()
    } 
    
    // Cell 높이조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                return 600
            default :
                return 44
            }
        } else if indexPath.section == 1 {
            return 330
            
        } else if indexPath.section == 2 {
            return 1000
            
        } else if indexPath.section == 3 {
            return 122
        }
        
        return 44
    }
}


extension InsidePageViewController {
    func didRetrieveDetail(result: DetailResponse) {
        detailData = result.result
        tableView.reloadData()
        print("DEBUG: 데이터 로딩 성공")
    }
    
    func failedToRequest(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}
