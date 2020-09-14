//
//  ViewController.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/17.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MainTabVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    func configureViewController() {
        
        // homeVC
        let homeVC = constructNavController(tabBarImage: "house", rootViewController: HomeVC())
        
        // likeVC
        let likeVC = constructNavController(tabBarImage: "suit.heart", rootViewController: LikeVC())
        
        // searchVC
        let searchVC = constructNavController(tabBarImage: "magnifyingglass", rootViewController: SearchVC())

        // historyVC
        let historyVC = constructNavController(tabBarImage: "doc", rootViewController: HistoryVC())
        
        // accountVC
        let accountVC = constructNavController(tabBarImage: "person", rootViewController: AccountVC())
        
        viewControllers = [homeVC, likeVC, searchVC, historyVC, accountVC]
        
        tabBar.tintColor = .black
    }
    
    func constructNavController(tabBarImage: String, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = UIImage(systemName: tabBarImage)
        navController.navigationBar.tintColor = .black
        
        return navController
    }
}

