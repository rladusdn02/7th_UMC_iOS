//
//  BaseViewController.swift
//  Kream
//
//  Created by 김연우 on 10/2/24.
//

import UIKit

class TabBarController: UITabBarController {
    private let homeVC = HomeViewController()
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myVC = UINavigationController(rootViewController: MyViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "homeVC", image: UIImage(named:"icon_home_fill"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "styleVC", image: UIImage(named:"icon_style_fill"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "shopVC", image: UIImage(named:"icon_shop_fill"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "savedVC", image: UIImage(named:"icon_saved_none"), tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "myVC", image: UIImage(named:"icon_my_none"), tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
        
    }

}
