//
//  MyProfileEditView.swift
//  Kream
//
//  Created by 김연우 on 10/2/24.
//

import UIKit
import SnapKit

class MyProfileEditView: UIView {
    
    private let viewLabel : UILabel = {
        let label = UILabel()
        label.text = "프로필 관리"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()

    // Profile Image
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_demo")
        return imageView
    }()

    // Email Field
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.text = "example@naver.com"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    // Password Field
    private let pwdField: UITextField = {
        let textField = UITextField()
        textField.text = "**********"
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    // Profile Information Group Label
    private let groupLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    // Change Buttons for Email and Password
    public let emailChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()

    public let pwdChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    // StackView for Email and Password
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailField, emailChangeButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var pwdStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwdField, pwdChangeButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    // Profile Info Container
    private lazy var profileInfoView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(viewLabel)
        addSubview(profileImageView)
        addSubview(profileInfoView)
        profileInfoView.addSubview(groupLabel)
        profileInfoView.addSubview(emailStackView)
        profileInfoView.addSubview(pwdStackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        viewLabel.snp.makeConstraints { $0.top.equalToSuperview().offset(66)
            $0.centerX.equalToSuperview()
        }
        profileImageView.snp.makeConstraints { $0.centerX.equalToSuperview()
            $0.top.equalTo(viewLabel.snp.bottom).offset(52)
            $0.height.equalTo(90)
            $0.width.equalTo(90)
        }
        
        profileInfoView.snp.makeConstraints { $0.top.equalTo(profileImageView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(200)
        }
        
        groupLabel.snp.makeConstraints { $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        emailStackView.snp.makeConstraints { $0.top.equalTo(groupLabel.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        pwdStackView.snp.makeConstraints { $0.top.equalTo(emailStackView.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
