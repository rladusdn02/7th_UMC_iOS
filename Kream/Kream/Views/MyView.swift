//
//  MyView.swift
//  Kream
//
//  Created by 김연우 on 10/2/24.
//

import UIKit
import SnapKit

class MyView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame) //뷰를 생성
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        //스토리보드에서는 지원 불가하는 기능 설정
        fatalError("init(coder:) has not been implemented")
    }
    private func addComponents() {
        self.addSubview(topFrame)
        topFrame.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(393)
            $0.height.equalTo(297)
        }
    }
    // MARK: - 상단 백그라운드 프레임
    private lazy var topFrame: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(topComponentGroup)
        topComponentGroup.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.width.equalTo(328)
            $0.height.equalTo(193)
            $0.centerX.equalToSuperview()
        }
        return view
    }()
    
    // MARK: - 상단 컴포넌트 그룹
    private lazy var topComponentGroup: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(topButtonGroup)
        topButtonGroup.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(0)
            $0.height.equalTo(25)
            $0.width.equalTo(328)
        }
        view.addSubview(profileFrame)
        profileFrame.snp.makeConstraints {
            $0.top.equalTo(topButtonGroup.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(0)
            $0.height.equalTo(90)
            $0.width.equalTo(221)
            
        }
        view.addSubview(profileButtonGroup)
        profileButtonGroup.snp.makeConstraints {
            $0.top.equalTo(profileFrame.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(0)
            $0.height.equalTo(26)
            $0.width.equalTo(328)
        }
        return view
    }()
    
    // MARK: - 상단 버튼 모음
    private lazy var topButtonGroup: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        //설정 버튼
        let setBtn = UIButton()
        setBtn.setTitle("", for: .normal)
        // TODO: - myPage 상단 버튼 구현
//        setBtn.addTarget(, action: , for: ) -> 추후 구현
        setBtn.setBackgroundImage(UIImage(named: "setting_btn"), for: .normal)
        view.addSubview(setBtn)
        setBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(0)
            $0.height.equalTo(25)
            $0.width.equalTo(25)
        }
        //카메라 버튼
        let camBtn = UIButton()
        camBtn.setTitle("", for: .normal)
//        setBtn.addTarget(, action: , for: ) -> 추후 구현
        camBtn.setBackgroundImage(UIImage(named: "camera_btn"), for: .normal)
        view.addSubview(camBtn)
        camBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.height.equalTo(25)
            $0.width.equalTo(25)
        }
        return view
    }()
    // MARK: - 프로필 프레임
    private lazy var profileFrame: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(profileImage)
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(0)
            $0.height.equalTo(90)
            $0.width.equalTo(90)
        }
        view.addSubview(accountInfo)
        accountInfo.snp.makeConstraints {            $0.left.equalTo(profileImage.snp.right).offset(16)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(48)
            $0.width.equalTo(115)
        }
        return view
    }()
    //프로필 사진 부분
    private lazy var profileImage: UIImageView = {
        let imgview = UIImageView()
        imgview.backgroundColor = .white
        imgview.image = UIImage(named: "profile_demo")
        return imgview
    }()
    
    // MARK: - 계정 정보 부분
    private lazy var accountInfo: UIView = {
        let view = UIView()

        // 유저 이름 라벨
        let usernameLabel = UILabel()
        usernameLabel.text = "Jeong_iOS"
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        // 팔로워 정보 라벨
        let followerLabel = UILabel()
        let followerCount = 326
        followerLabel.text = "팔로워 \(followerCount)"
        followerLabel.font = UIFont.systemFont(ofSize: 12)

        // 팔로잉 정보 라벨
        let followingLabel = UILabel()
        let followingCount = 20
        followingLabel.text = "팔로잉 \(followingCount)"
        followingLabel.font = UIFont.systemFont(ofSize: 12)
        
        // 팔로워/팔로잉 그룹
        let infoStackView = UIStackView(arrangedSubviews: [followerLabel, followingLabel])
        infoStackView.axis = .horizontal
        infoStackView.spacing = 8
        infoStackView.alignment = .leading
        
        // 계정 정보 뷰에 서브뷰 추가
        view.addSubview(usernameLabel)
        view.addSubview(infoStackView)

        // 레이아웃 설정
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(0)
        }

        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        return view
    }()
    
    // MARK: - 프로필 버튼 모음
    public lazy var profileButtonGroup: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        // 프로필 관리 버튼 추가
        view.addSubview(profileEditBtn)
        profileEditBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(0)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
        
        // 프로필 공유 버튼 추가
        view.addSubview(profileShareBtn)
        profileShareBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.equalTo(profileEditBtn.snp.right).offset(14)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
        
        return view
    }()
    public lazy var profileEditBtn: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium) // 글자 크기와 폰트 설정
        button.backgroundColor = .white // 배경색 설정
        button.layer.cornerRadius = 10 // 굴곡 설정
        button.layer.borderColor = UIColor.black.cgColor // 테두리 색 설정
        button.layer.borderWidth = 1 // 테두리 두께 설정
        return button
    }()

    public lazy var profileShareBtn: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium) // 글자 크기와 폰트 설정
        button.backgroundColor = .white // 배경색 설정
        button.layer.cornerRadius = 10 // 굴곡 설정
        button.layer.borderColor = UIColor.black.cgColor // 테두리 색 설정
        button.layer.borderWidth = 1 // 테두리 두께 설정
        return button
    }()
}
