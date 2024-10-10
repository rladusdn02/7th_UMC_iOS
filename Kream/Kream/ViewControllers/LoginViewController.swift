//
//  ViewController.swift
//
//  Created by 김연우 on 9/23/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    //login view
    private lazy var loginView: LoginView = {
        let loginView = LoginView()
        
        loginView.LoginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        return loginView
    }()
// safeArea확인 코드
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        let safeAreaInsets = view.safeAreaInsets
//        print("Safe Area Insets - Top: \(safeAreaInsets.top), Bottom: \(safeAreaInsets.bottom), Left: \(safeAreaInsets.left), Right: \(safeAreaInsets.right)")
//    }
    
    @objc private func loginBtnTapped() {
        let loginUser = LoginUser(email: "qwer@naver.com", password: "1234")
        print("loginUserData : \(loginUser)")
        //버튼을 누를면 TabBarController로  전환 : Modal
        let tabController = TabBarController()
        print("로그인 버튼 눌림")
        tabController.modalPresentationStyle = .fullScreen
        present(tabController, animated: true)
        
    }
}
