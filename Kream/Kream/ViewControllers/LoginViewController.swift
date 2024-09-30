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
    
    //login controller
    private lazy var loginView: LoginView = {
        let loginView = LoginView()
        
        loginView.LoginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        return loginView
    }()
    
    @objc private func loginBtnTapped() {
        let loginUser = LoginUser(email: "qwer@naver.com", password: "1234")
        print("loginUserData : \(loginUser)")
    }
}
