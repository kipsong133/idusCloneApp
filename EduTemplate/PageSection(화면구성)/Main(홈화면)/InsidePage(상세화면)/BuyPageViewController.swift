//
//  BuyPageViewController.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/11.
//

import UIKit

class BuyPageViewController: BaseViewController {
    

    let menuHeight = UIScreen.main.bounds.height / 2
    var isPresenting = false
    
    //MARK: - Outlet
    
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var selectEAView: UIView!
    @IBOutlet weak var cartBtnOutlet: UIButton!
    @IBOutlet weak var buyBtnOutlet: UIButton!
    @IBOutlet weak var eaDisplay: UILabel!
    
    @IBOutlet weak var displayNumber: UILabel!
    var num = 1
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    var testPrice = 14500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BuyPageViewController.handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    init() {
        super.init(nibName: "BuyPageViewController", bundle: nil)
        modalPresentationStyle = .custom
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
        view.backgroundColor = .clear
        
        eaDisplay.borderWidth = 1
        eaDisplay.borderColor = #colorLiteral(red: 0.6744570136, green: 0.6745396256, blue: 0.6744288802, alpha: 1)
        eaDisplay.backgroundColor = .white
        
        
        selectionView.cornerRadius = CGFloat(5)
        selectionView.borderWidth = CGFloat(1)
        selectionView.borderColor = .gray
        
        selectEAView.cornerRadius = CGFloat(5)
        selectEAView.borderWidth = CGFloat(1)
        selectEAView.borderColor = .gray
        
        cartBtnOutlet.cornerRadius = CGFloat(5)
        cartBtnOutlet.borderColor = .gray
        cartBtnOutlet.borderWidth = CGFloat(1)
        
        buyBtnOutlet.cornerRadius = CGFloat(5)
        buyBtnOutlet.borderColor = .mainOrange
        buyBtnOutlet.borderWidth = CGFloat(1)
        

    }
    
    //MARK: - Action
    
    @IBAction func buyBtn(_ sender: Any) {
        
        // 구매화면으로 이동.
        //NextBuyPageViewController
        let vc = UINavigationController(rootViewController: NextBuyPageViewController())
//        self.changeRootViewController(NextBuyPageViewController())
//        self.navigationController?.pushViewController(NextBuyPageViewController(), animated: true)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func plus(_ sender: Any) {
        num += 1
        self.displayNumber.text = "\(num)"
        self.price.text = "\(num * testPrice)원"
        self.totalPrice.text = "\(num * testPrice)원"

    }
    
    @IBAction func minurs(_ sender: Any) {
        if num > 0 {
            num -= 1
            self.displayNumber.text = "\(num)"
            self.price.text = "\(num * testPrice)원"
            self.totalPrice.text = "\(num * testPrice)원"
        } else {
            self.displayNumber.text = "0원"
        }
    }
    
    
    
    
}
