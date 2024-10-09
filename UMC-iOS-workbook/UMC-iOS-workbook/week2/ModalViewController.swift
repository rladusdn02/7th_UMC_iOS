//
//  ModalViewController.swift
//  UMC-iOS-workbook
//
//  Created by 김연우 on 9/30/24.
//

import UIKit
import SnapKit

class ModalViewController: UIViewController {
    
    private let label = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요"
        label.textColor = .cyan
        
        //버튼 제목 부여
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.backgroundColor = .systemIndigo
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(255)
        }
    }
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        print("버튼눌림")
        
        viewController.view.backgroundColor = .red
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
