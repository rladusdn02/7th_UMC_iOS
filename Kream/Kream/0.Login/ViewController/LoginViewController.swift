//
//  ViewController.swift
//
//  Created by 김연우 on 9/23/24.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    //login view
    private lazy var loginView: LoginView = {
        let loginView = LoginView()
        
        loginView.LoginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        loginView.kakaologinButton.addTarget(self, action: #selector(kakaologinButtonTapped), for: .touchUpInside)
        return loginView
    }()
    
    @objc private func loginBtnTapped() {
        let loginUser = LoginUser(email: "qwer@naver.com", password: "1234")
        print("loginUserData : \(loginUser)")
        gotoMainHome()
        print("로그인 버튼 눌림")
        
        
    }
    
    @objc private func kakaologinButtonTapped() {
        print("카카오 로그인 버튼 눌림")
        //MARK: - 카카오톡으로 로그인
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print("카카오톡 로그인 실패: \(error.localizedDescription)")
                }
                else {
                    print("카카오톡 로그인 성공: \(oauthToken?.accessToken ?? "")")

                    // 성공 시 동작 구현
                    self.gotoMainHome()
                }
            }
            //MARK: - 카카오톡 없으면 실행
        } else{
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print("카카오 계정 로그인 실패: \(error.localizedDescription)")
                    }
                    else {
                        print("카카오 계정 로그인 성공: \(oauthToken?.accessToken ?? "")")

                        // 성공 시 동작 구현
                        self.gotoMainHome()
                    }
                }
        }
        
    }
    
    private func gotoMainHome(){
        let tabController = TabBarController()
        tabController.modalPresentationStyle = .fullScreen
        present(tabController, animated: true)
    }
}
