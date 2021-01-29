//
//  BaseTabBarController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    let actionViewController  = ActionMainViewController()
    let classViewController = ClassViewController()
    let searchViewController = SearchViewController()
    let categoryViewController = CategoryViewController()
    let myProfileViewController = MyProfileViewController()
    
    
    //MARK: Todo: 네트워크할 때 변경할 것.
//    let networkViewController = NetworkMainViewController()
    
    let actionTabBarItem  = UITabBarItem(title: "작품", image: #imageLiteral(resourceName: "작품"), tag: 0)
    let classTabBarItem = UITabBarItem(title: "클래스", image: #imageLiteral(resourceName: "클래스"), tag: 1)
    let searchTabBarItem = UITabBarItem(title: "검색", image: #imageLiteral(resourceName: "검색"), tag: 2)
    let categoryTabBarItem = UITabBarItem(title: "카테고리", image: #imageLiteral(resourceName: "카테고리"), tag: 3)
    let myProfileTabBarItem = UITabBarItem(title: "내 정보", image: #imageLiteral(resourceName: "내정보"), tag: 4)

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionNavigationController = UINavigationController(rootViewController: actionViewController)
        let classNavigationController = UINavigationController(rootViewController: classViewController)
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        let categoryNavigationController = UINavigationController(rootViewController: categoryViewController)
        let myProfileNavigationController = UINavigationController(rootViewController: myProfileViewController)

        actionNavigationController.tabBarItem  = actionTabBarItem
        classNavigationController.tabBarItem = classTabBarItem
        searchNavigationController.tabBarItem = searchTabBarItem
        categoryNavigationController.tabBarItem = categoryTabBarItem
        myProfileNavigationController.tabBarItem = myProfileTabBarItem
        
        actionNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "selected작품")
        classNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "selected클래스")
        searchNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "검색")
        categoryNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "selected카테고리")
        myProfileNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "selected내정보")
        
        // 내비게이션 탭바 색상변경
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let unselectedColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        let seletedColor = UIColor.mainOrange
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: seletedColor], for: .selected)
        
        
        
        
//        networkNavigationController.tabBarItem = classTabBarItem
        
        self.viewControllers = [actionNavigationController, classNavigationController,searchNavigationController,categoryNavigationController,myProfileNavigationController]
        
        self.delegate = self
    }
}
