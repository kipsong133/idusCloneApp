//
//  ClassViewController.swift
//  EduTemplate
//
//  Created by 김우성 on 2021/01/07.
//

import UIKit


class ClassViewController: BaseViewController, ClassCustomMenuBarDelegate {
    let pageCell = PageCell()


    
    
    

    
    //MARK: -  Property    
    var pageCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var classCustomMenu = ClassCustomMenu()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상단 내비게이션 없애고 싶으면 설정할 것.
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.hidesBarsOnTap = false
        setupCustomTabBar()
        setupPageCollectionView()
        
        // UI 구현
        configureNavigationUI()
        // 내비게이션 타이틀
        
    
        view.backgroundColor = .white
        
    }
    
    
    //MARK: - Action
    
    @objc func dummy() {
        
    }
    
    
    
    //MARK: - Helpers
    
    // UI 구현 메소드
    func configureNavigationUI() {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20)) 
        imageView.contentMode = .scaleAspectFit 
        let image = UIImage(named: "textFieldImage") 
        imageView.image = image 
        navigationItem.titleView = imageView

        
        let logoIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "logo"), style: .plain, target: self, action: #selector(dummy))
//        let textFieldIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "32pixLessonIcon"), style: .plain, target: self, action: #selector(dummy))
        let cartIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "카트아이콘"), style: .plain, target: self, action: #selector(dummy))

        
        self.navigationItem.leftBarButtonItem = logoIcon
        self.navigationItem.rightBarButtonItem = cartIcon
    }
    
    
    
    
    func setupCustomTabBar(){
        self.view.addSubview(classCustomMenu)
        classCustomMenu.delegate = self
        classCustomMenu.translatesAutoresizingMaskIntoConstraints = false
        classCustomMenu.indicatorViewWidthConstraint.constant = self.view.frame.width / 2
        classCustomMenu.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        classCustomMenu.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        classCustomMenu.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        classCustomMenu.heightAnchor.constraint(equalToConstant: 35).isActive = true // default : 60
    }
    
    func customMenuBar(scrollTo index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        self.pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func setupPageCollectionView(){
        // Delegate 
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        
        // UI설정
        pageCollectionView.backgroundColor = .gray
        pageCollectionView.showsHorizontalScrollIndicator = false
        pageCollectionView.isPagingEnabled = true
        pageCollectionView.register(UINib(nibName: PageCell.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: PageCell.reusableIdentifier)
        
        //RealTimeCell
        pageCollectionView.register(UINib(nibName: "RealTimeCell", bundle: nil), forCellWithReuseIdentifier: "RealTimeCell")
        
        //PopularPageCell
        pageCollectionView.register(UINib(nibName: "PopularPageCell", bundle: nil), forCellWithReuseIdentifier: "PopularPageCell")
        
        //PopularSellerCell
        pageCollectionView.register(UINib(nibName: "PopularSellerCell", bundle: nil), forCellWithReuseIdentifier: "PopularSellerCell")
        
        //OnlineCollectionViewCell
        pageCollectionView.register(UINib(nibName: "OnlineCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnlineCollectionViewCell")
        
        // OfflineCollectionViewCell
        pageCollectionView.register(UINib(nibName: "OfflineCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OfflineCollectionViewCell")
        
        self.view.addSubview(pageCollectionView)
        
        // 오토레이아웃 적용
        pageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pageCollectionView.topAnchor.constraint(equalTo: self.classCustomMenu.bottomAnchor).isActive = true
    }
    
    
}


//MARK:- UICollectionViewDelegate, UICollectionViewDataSource

extension ClassViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnlineCollectionViewCell", for: indexPath) as! OnlineCollectionViewCell
        return cell
            
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfflineCollectionViewCell", for: indexPath) as! OfflineCollectionViewCell
            return cell
            
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularPageCell", for: indexPath) as! PopularProductCell
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularSellerCell", for: indexPath) as! PopularSellerCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        classCustomMenu.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 2
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        let indexPath = IndexPath(item: itemAt, section: 0)
        classCustomMenu.customTabBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    
}












//MARK:- UICollectionViewDelegateFlowLayout

extension ActionMainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
