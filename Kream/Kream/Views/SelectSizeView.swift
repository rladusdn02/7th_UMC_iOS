//
//  SelectSizeView.swift
//  Kream

import UIKit
import SnapKit

class SelectSizeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addConponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 점퍼 사진
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "purchaseJacket")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 상품 이름(영문)
    public lazy var productEngNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    // 상품 이름(한글+색상)
    public lazy var productKorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "마뗑킴 로고 코팅 점퍼 블랙"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    // 사이즈 선택 (CollectionView)
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 110, height: 50) // 셀 크기 설정
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.allowsMultipleSelection = false // 단일 선택 모드 활성화
        collectionView.register(SizeCollectionViewCell.self, forCellWithReuseIdentifier: SizeCollectionViewCell.identifier)
        return collectionView
    }()
    
    // 빠른배송 버튼
    public let fastButton: PurchaseButton = PurchaseButton(frame: .zero, btnType: .fastShip)
    // 일반배송 버튼
    public let generalButton: PurchaseButton = PurchaseButton(frame: .zero, btnType: .generalShip)
    
    // 버튼 텍스트 및 스타일 설정
    private func setupButtonTexts() {
        fastButton.priceLabel.text = "345,000"
        fastButton.subLabel.text = "빠른배송(1-2일 소요)"
        
        generalButton.priceLabel.text = "407,000"
        generalButton.subLabel.text = "일반배송(5-7일 소요)"
    }
    
    // 하단 버튼 뷰
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        // 버튼 스택뷰 생성
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 6
        buttonStackView.distribution = .fillEqually // 버튼 크기 자동 균등 분배
        
        // 버튼 추가
        buttonStackView.addArrangedSubview(fastButton)
        buttonStackView.addArrangedSubview(generalButton)
        setupButtonTexts()
        
        view.addSubview(buttonStackView)
        
        // 스택뷰 제약 조건
        buttonStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        
        return view
    }()
    
    private func addConponents() {
        addSubview(productImageView)
        addSubview(productEngNameLabel)
        addSubview(productKorNameLabel)
        addSubview(collectionView)
        addSubview(bottomView)
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.width.height.equalTo(91)
        }
        
        productEngNameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.top).offset(10)
            $0.left.equalTo(productImageView.snp.right).offset(15)
            $0.right.equalToSuperview().offset(-16)
        }
        
        productKorNameLabel.snp.makeConstraints {
            $0.top.equalTo(productEngNameLabel.snp.bottom).offset(8)
            $0.left.equalTo(productImageView.snp.right).offset(15)
            $0.right.equalToSuperview().offset(-16)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(200) // 컬렉션 뷰 높이
        }
        
        bottomView.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
}
