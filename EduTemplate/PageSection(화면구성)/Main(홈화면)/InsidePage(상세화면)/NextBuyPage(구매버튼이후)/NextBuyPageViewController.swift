//
//  NextBuyPageViewController.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/12.
//

import UIKit

protocol alertDelegate {
    func safeNumberAlert()
}

class NextBuyPageViewController: UIViewController  {
    

    
    //MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        configureNib()
        configureNavi()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9685532451, green: 0.9686692357, blue: 0.968513906, alpha: 1)
    }

    
    
    //MARK: - Action
    
    @objc func backAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func paymentBtn(_ sender: Any) {
        
        let input = PaymentInInput(addressIdx: 1,
                                   receiverName: "우노",
                                   mobileNo: "0100101101",
                                   address: "반포 자이",
                                   supportSeller: 0,
                                   paymentMethod: 1,
                                   useTmpMobileNo: 1,
                                   optionIdx: [1,2],
                                   detailedOptionIdx: [1,2])
        
        PaymentDataManager().postSignIn(input, viewController: self)
    }
    
    
    
    //MARK: - Helpers
    
    func configureNib() {
        // 섹션 1
        let BuyerTableViewCellNibName = UINib(nibName: "BuyerTableViewCell", bundle: nil)
        tableView.register(BuyerTableViewCellNibName, forCellReuseIdentifier: "BuyerTableViewCell")

        // 섹션 2
        let ReceiverTableViewCellNibName = UINib(nibName: "ReceiverTableViewCell", bundle: nil)
        tableView.register(ReceiverTableViewCellNibName, forCellReuseIdentifier: "ReceiverTableViewCell")
        
        let PostCodeTableViewCellNibName = UINib(nibName: "PostCodeTableViewCell", bundle: nil)
        tableView.register(PostCodeTableViewCellNibName, forCellReuseIdentifier: "PostCodeTableViewCell")
        
        let PostCodeDetailTableViewCellNibName = UINib(nibName: "PostCodeDetailTableViewCell", bundle: nil)
        tableView.register(PostCodeDetailTableViewCellNibName, forCellReuseIdentifier: "PostCodeDetailTableViewCell")
        
        let SafeNumberTableViewCellNibName = UINib(nibName: "SafeNumberTableViewCell", bundle: nil)
        tableView.register(SafeNumberTableViewCellNibName, forCellReuseIdentifier: "SafeNumberTableViewCell")
        
        let PhoneNumberTableViewCellNibName = UINib(nibName: "PhoneNumberTableViewCell", bundle: nil)
        tableView.register(PhoneNumberTableViewCellNibName, forCellReuseIdentifier: "PhoneNumberTableViewCell")
        
        // 섹션 3
        let OrderInfoTableViewCellNibName = UINib(nibName: "OrderInfoTableViewCell", bundle: nil)
        tableView.register(OrderInfoTableViewCellNibName, forCellReuseIdentifier: "OrderInfoTableViewCell")
        
        // 섹션 4 PaymentTableViewCell
        let PaymentTableViewCellNibName = UINib(nibName: "PaymentTableViewCell", bundle: nil)
        tableView.register(PaymentTableViewCellNibName, forCellReuseIdentifier: "PaymentTableViewCell")
        
        // 섹션 5 EasyPaymentTableViewCell
        let EasyPaymentTableViewCellNibName = UINib(nibName: "EasyPaymentTableViewCell", bundle: nil)
        tableView.register(EasyPaymentTableViewCellNibName, forCellReuseIdentifier: "EasyPaymentTableViewCell")
        
        let ComplexPaymentTableViewCellNibName = UINib(nibName: "ComplexPaymentTableViewCell", bundle: nil)
        tableView.register(ComplexPaymentTableViewCellNibName, forCellReuseIdentifier: "ComplexPaymentTableViewCell")
        
        let ChaiTableViewCellNibName = UINib(nibName: "ChaiTableViewCell", bundle: nil)
        tableView.register(ChaiTableViewCellNibName, forCellReuseIdentifier: "ChaiTableViewCell")
        
        let NaverPayTableViewCellNibName = UINib(nibName: "NaverPayTableViewCell", bundle: nil)
        tableView.register(NaverPayTableViewCellNibName, forCellReuseIdentifier: "NaverPayTableViewCell")
        
        let BankTransferTableViewCellNibName = UINib(nibName: "BankTransferTableViewCell", bundle: nil)
        tableView.register(BankTransferTableViewCellNibName, forCellReuseIdentifier: "BankTransferTableViewCell")
        
        let PhonePaymentTableViewCellNibName = UINib(nibName: "PhonePaymentTableViewCell", bundle: nil)
        tableView.register(PhonePaymentTableViewCellNibName, forCellReuseIdentifier: "PhonePaymentTableViewCell")
        
        let TossTableViewCellNibName = UINib(nibName: "TossTableViewCell", bundle: nil)
        tableView.register(TossTableViewCellNibName, forCellReuseIdentifier: "TossTableViewCell")
        
        // 섹션 6 PaymentInfoTableViewCell
        let PaymentInfoTableViewCellNibName = UINib(nibName: "PaymentInfoTableViewCell", bundle: nil)
        tableView.register(PaymentInfoTableViewCellNibName, forCellReuseIdentifier: "PaymentInfoTableViewCell")
        
        //
        let TotalTableViewCellNibName = UINib(nibName: "TotalTableViewCell", bundle: nil)
        tableView.register(TotalTableViewCellNibName, forCellReuseIdentifier: "TotalTableViewCell")
        
        // 
        let PersonalInfoTableViewCellNibName = UINib(nibName: "PersonalInfoTableViewCell", bundle: nil)
        tableView.register(PersonalInfoTableViewCellNibName, forCellReuseIdentifier: "PersonalInfoTableViewCell")
    }
    
    
    
    func configureNavi() {
        
        let backBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "뒤로가기버튼"), style: .plain, target: self, action: #selector(backAction))
        let orderTitle = UIBarButtonItem(image: #imageLiteral(resourceName: "주문 결제"), style: .plain, target: self, action: #selector(backAction))
        
        navigationItem.leftBarButtonItems = [backBtn, orderTitle]
        
        
        
        
    }
    
    
}






//MARK: - TableViewDelegate Protocol

extension NextBuyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 5
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 7
        } else if section == 5 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            // 주문고객 섹션
            let cell = tableView.dequeueReusableCell(withIdentifier: "BuyerTableViewCell") as! BuyerTableViewCell
            return cell
            
        } else if indexPath.section == 1 {
            // 주소(배송지) 섹션
            if indexPath.row == 0 {
                // PostCodeTableViewCell
                let cell = tableView.dequeueReusableCell(withIdentifier: "PostCodeTableViewCell") as! PostCodeTableViewCell
                return cell
                
            } else if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverTableViewCell") as! ReceiverTableViewCell
                return cell
                
            } else if indexPath.row == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneNumberTableViewCell") as! PhoneNumberTableViewCell
                return cell
                
            } else if indexPath.row == 3{
                let cell = tableView.dequeueReusableCell(withIdentifier: "PostCodeDetailTableViewCell") as! PostCodeDetailTableViewCell
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SafeNumberTableViewCell") as! SafeNumberTableViewCell
                return cell
            }
            
        } else if indexPath.section == 2 {
            // 주문 작품정보 섹션 OrderInfoTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderInfoTableViewCell") as! OrderInfoTableViewCell
            return cell
            
        } else if indexPath.section == 3 {
            // 아이디어스 할인 혜택 섹션 
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTableViewCell") as! PaymentTableViewCell
            return cell
            
        } else if indexPath.section == 4 {
            // 결제수단 섹션  EasyPaymentTableViewCell
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EasyPaymentTableViewCell") as! EasyPaymentTableViewCell
                return cell
                
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ComplexPaymentTableViewCell") as! ComplexPaymentTableViewCell
                return cell
                
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ChaiTableViewCell") as! ChaiTableViewCell
                return cell
                
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NaverPayTableViewCell") as! NaverPayTableViewCell
                return cell
                
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "BankTransferTableViewCell") as! BankTransferTableViewCell
                return cell
                
            } else if indexPath.row == 5 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhonePaymentTableViewCell") as! PhonePaymentTableViewCell
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TossTableViewCell") as! TossTableViewCell
                return cell
                
            }
            
        } else if indexPath.section == 5 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentInfoTableViewCell") as! PaymentInfoTableViewCell
                return cell
                
            } else {  
                let cell = tableView.dequeueReusableCell(withIdentifier: "TotalTableViewCell") as! TotalTableViewCell
                return cell  
                
            }
            
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalInfoTableViewCell") as! PersonalInfoTableViewCell
            return cell 
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
                return 50
         
        } else if indexPath.section == 1 {
            if indexPath.row == 3 {
                return 110
            }
            return 50
            
        } else if indexPath.section == 2 {
            return 50
            
        } else if indexPath.section == 3 {
            return 120
            
        } else if indexPath.section == 4 {
            return 50
            
        } else if indexPath.section == 5 { 
            return 100
            
        } else {
            return 50
        }
    }
    
    
    
}

//MARK: - Networking Method

extension NextBuyPageViewController {
    func didSuccessPayment(_ result: String) {
        self.presentAlert(title: "구매 결과", message: result) { (_) in
    
            self.changeRootViewController(BaseTabBarController())

        }
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
