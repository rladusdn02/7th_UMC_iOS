//
//  LoginView.swift
//  Kream
//
//  Created by 김연우 on 9/24/24.
//

import UIKit
import SnapKit

class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 상단 로고 이미지 뷰
    public lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kream-logo")
        return imageView
    }()
    
    // 이메일 뷰
    private lazy var emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        
        emailLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(8)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-10)
            $0.height.equalTo(34)
        }
        
        return view
    }()
    
    // 이메일 라벨
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.black
        return label
    }()
    
    // 이메일 입력 필드
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        textField.placeholder = "   예) kream@kream.co.kr"
        return textField
    }()
    
    // 비밀번호 뷰
    private lazy var pwdView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        
        view.addSubview(pwdLabel)
        view.addSubview(pwdTextField)
        
        pwdLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
        pwdTextField.snp.makeConstraints {
            $0.top.equalTo(pwdLabel.snp.bottom).offset(8)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-10)
            $0.height.equalTo(34)
        }
        
        return view
    }()
    
    // 비밀번호 라벨
    private lazy var pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.black
        return label
    }()
    
    // 비밀번호 입력 필드
    public lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        textField.placeholder = "   비밀번호를 입력해주세요"
        return textField
    }()
    
    // 로그인 버튼
    public lazy var LoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    // 컴포넌트 추가
    private func addComponents() {
        self.addSubview(logoImageView)
        self.addSubview(emailView)
        self.addSubview(pwdView)
        self.addSubview(LoginButton)
    }
    
    private func setupConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(126)
            $0.centerX.equalToSuperview()
        }
        
        emailView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(87)
            $0.left.right.equalToSuperview().inset(45)
        }
        
        pwdView.snp.makeConstraints {
            $0.top.equalTo(emailView.snp.bottom).offset(17)
            $0.left.right.equalToSuperview().inset(45)
        }
        
        LoginButton.snp.makeConstraints {
            $0.top.equalTo(pwdView.snp.bottom).offset(17)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(38)
        }
    }
}