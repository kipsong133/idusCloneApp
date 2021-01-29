//
//  ActionMainViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import UIKit



class ActionMainViewController: BaseViewController, CustomMenuBarDelegate {
    let pageCell = PageCell()


    
    
    

    
    //MARK: -  Property    
    var pageCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var customMenuBar = CustomMenuBar()

    
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
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let logoIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "logo"), style: .plain, target: self, action: #selector(dummy))
//        let textFieldIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "32pixLessonIcon"), style: .plain, target: self, action: #selector(dummy))
        let cartIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "카트아이콘"), style: .plain, target: self, action: #selector(dummy))

        
        self.navigationItem.leftBarButtonItem = logoIcon
        self.navigationItem.rightBarButtonItem = cartIcon
    }
    
    
    
    
    func setupCustomTabBar(){
        self.view.addSubview(customMenuBar)
        customMenuBar.delegate = self
        customMenuBar.translatesAutoresizingMaskIntoConstraints = false
        customMenuBar.indicatorViewWidthConstraint.constant = self.view.frame.width / 4
        customMenuBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        customMenuBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        customMenuBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        customMenuBar.heightAnchor.constraint(equalToConstant: 35).isActive = true // default : 60
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
        pageCollectionView.backgroundColor = #colorLiteral(red: 0.9489471316, green: 0.9490606189, blue: 0.9489082694, alpha: 1)
        pageCollectionView.showsHorizontalScrollIndicator = false
        pageCollectionView.isPagingEnabled = true
        pageCollectionView.register(UINib(nibName: PageCell.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: PageCell.reusableIdentifier)
        
        //RealTimeCell
        pageCollectionView.register(UINib(nibName: "RealTimeCell", bundle: nil), forCellWithReuseIdentifier: "RealTimeCell")
        
        //PopularPageCell
        pageCollectionView.register(UINib(nibName: "PopularPageCell", bundle: nil), forCellWithReuseIdentifier: "PopularPageCell")
        
        //PopularSellerCell
        pageCollectionView.register(UINib(nibName: "PopularSellerCell", bundle: nil), forCellWithReuseIdentifier: "PopularSellerCell")
        
        
        self.view.addSubview(pageCollectionView)
        
        // 오토레이아웃 적용
        pageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pageCollectionView.topAnchor.constraint(equalTo: self.customMenuBar.bottomAnchor).isActive = true
    }
    
    
}


//MARK:- UICollectionViewDelegate, UICollectionViewDataSource

extension ActionMainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.reusableIdentifier, for: indexPath) as! PageCell
        //        cell.label.text = "\(indexPath.row + 1)번째 뷰"
        return cell
            
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RealTimeCell", for: indexPath) as! RealTimeCell
            //        cell.label.text = "\(indexPath.row + 1)번째 뷰"
            return cell
            
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularPageCell", for: indexPath) as! PopularProductCell
            //        cell.label.text = "\(indexPath.row + 1)번째 뷰"
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularSellerCell", for: indexPath) as! PopularSellerCell
            //        cell.label.text = "\(indexPath.row + 1)번째 뷰"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customMenuBar.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 4
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        let indexPath = IndexPath(item: itemAt, section: 0)
        customMenuBar.customTabBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    
}












//MARK:- UICollectionViewDelegateFlowLayout

extension ClassViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
