//
//  EditViewController.swift
//  Kream
//
//  Created by 김연우 on 10/2/24.
//

import UIKit

class EditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("editView 열림")
        self.view = editView
    }
    //ProfileEdit view
    private lazy var editView: MyProfileEditView = {
        let editView = MyProfileEditView()
        editView.emailChangeButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        editView.pwdChangeButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        print("버튼누르기 전")
        return editView
    }()
    
    // 액션 메서드 추가
    @objc private func editButtonTapped() {
        print("수정 버튼이 눌렸습니다.")
    }
}
