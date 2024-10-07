//
//  MyViewController.swift
//  Kream
//
//  Created by 김연우 on 10/2/24.
//

import UIKit
import SnapKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
    }
    //MyPage view
    private lazy var myView: MyView = {
        let myView = MyView()
        myView.profileEditBtn.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        print("버튼누르기 전")
        print(myView.profileEditBtn.frame)
        return myView
    }()
    
    // 액션 메서드 추가
    @objc private func editButtonTapped() {
        print("프로필 관리 버튼이 눌렸습니다.")
        let EditViewController = EditViewController()
        navigationController?.pushViewController(EditViewController, animated: true)
    }

    @objc private func shareButtonTapped() {
        print("프로필 공유 버튼이 눌렸습니다.")
    }
}
