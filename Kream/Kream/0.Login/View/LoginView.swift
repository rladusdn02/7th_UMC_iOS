//
//  LoginView.swift
//  Kream
//
//  Created by 김연우 on 9/24/24.
//

import UIKit

class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame) //뷰를 생성
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        //스토리보드에서는 지원 불가하는 기능 설정
        fatalError("init(coder:) has not been implemented")
    }
    private func addComponents() { //autolayout 지정하는곳
        self.addSubview(logoImageView)
        self.addSubview(emailView)
        self.addSubview(pwdView)
        self.addSubview(LoginButton)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        emailView.translatesAutoresizingMaskIntoConstraints = false
        pwdView.translatesAutoresizingMaskIntoConstraints = false
        LoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emailView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 87),
            emailView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            
            pwdView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 17),
            pwdView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            
            LoginButton.topAnchor.constraint(equalTo: pwdView.bottomAnchor, constant: 17),
            LoginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
        ])
    }
    
    //상단 로고 이미지 뷰
    public lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kream-logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    private lazy var loginView: UIView
    
    //이메일 뷰
    private lazy var emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            // emailLabel 좌측 정렬
            emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0), // 좌측 정렬
            
            // emailTextField 제약
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            emailTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            // pwdTextField의 고정된 너비 및 높이 설정
            emailTextField.widthAnchor.constraint(equalToConstant: 303), // 너비를 303px로 설정
            emailTextField.heightAnchor.constraint(equalToConstant: 34)  // 높이를 34px로 설정
        ])
        
        return view
    }()
    
    //이메일 라벨
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 이메일 입력 필드
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 15 // Update corner radius to 15
        textField.backgroundColor = .clear //배경색 설정
        textField.layer.masksToBounds = true
        // 테두리 색 및 두께 설정
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1.0
        
        textField.textColor = .black
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        textField.textColor = UIColor.black
        textField.textAlignment = .left
        textField.placeholder="   예) kream@kream.co.kr"
        return textField
    }()
    
    //비밀번호 뷰
    private lazy var pwdView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        
        pwdLabel.translatesAutoresizingMaskIntoConstraints = false
        pwdTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pwdLabel)
        view.addSubview(pwdTextField)
        
        NSLayoutConstraint.activate([
            // pwdLabel 좌측 정렬
            pwdLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0), // 상단 여백
            pwdLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0), // 좌측 정렬
            
            // pwdTextField 제약
            pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor, constant: 8), // pwdLabel 아래 여백 8
            pwdTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0), // 좌측 정렬
            
            // pwdTextField의 고정된 너비 및 높이 설정
            pwdTextField.widthAnchor.constraint(equalToConstant: 303), // 너비를 303px로 설정
            pwdTextField.heightAnchor.constraint(equalToConstant: 34),  // 높이를 34px로 설정
            
            // 필요에 따라 아래쪽 제약 조정
            pwdTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10) // 아래 여백 10
        ])
        
        return view
    }()
    
    //비밀번호 라벨
    private lazy var pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 비밀번호 입력 필드
    public lazy var pwdTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 15 // Update corner radius to 15
        textField.layer.masksToBounds = true
        
        // 테두리 색 및 두께 설정
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1.0
        
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        textField.textAlignment = .left
        textField.placeholder = "   비밀번호를 입력해주세요"
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // 버튼 내부 텍스트 폰트 지정 컨테이너
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        container.foregroundColor = UIColor.white
        return container
    }()
    
    // 로그인버튼
    public lazy var LoginButton: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.attributedTitle = AttributedString("로그인", attributes: titleContainer)
        configuration.titleAlignment = .center
        btn.configuration = configuration
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        // 테두리 곡률 설정
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        
        // 배경색 설정
        btn.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0) // #D9D9D9
        
        // 크기 설정 (width: 303px, height: 38px)
        btn.widthAnchor.constraint(equalToConstant: 303).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        return btn
    }()
    
    
    
}
