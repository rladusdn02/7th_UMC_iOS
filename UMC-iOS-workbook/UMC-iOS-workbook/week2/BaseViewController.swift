//
//  BaseViewController.swift
//  UMC-iOS-workbook
//
//  Created by 김연우 on 9/30/24.
//

import UIKit

class BaseViewController: UITabBarController {
    private let modalVC = ModalViewController()
    private let navigationVC = NavigationViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        modalVC.tabBarItem = UITabBarItem(title: "modalVC", image: UIImage(systemName: "apple.terminal"), tag: 0)
        navigationVC.tabBarItem = UITabBarItem(title: "navigationVC", image: UIImage(systemName: "tray.full"), tag: 1)
        
        self.viewControllers = [modalVC, navigationVC]

    }

}
