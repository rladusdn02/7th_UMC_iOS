import UIKit
import SnapKit

// `PurchaseView` 클래스
class PurchaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        addComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 현재 선택된 자켓 이미지
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "purchaseJacket")
        return imageView
    }()
    
    // 여러 자켓 컬렉션 뷰
    ///PurchaseController에서 접근해야하므로 public
    // 여러 자켓 컬렉션 뷰
    public let jacketsCollectionView: UICollectionView = {
        // 레이아웃 설정
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 53, height: 53)
        
        // UICollectionView 생성
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(JacketsCollectionViewCell.self, forCellWithReuseIdentifier: JacketsCollectionViewCell.identifier)
        return collectionView
    }()
    
    // 즉시 구매가 라벨
    private lazy var purchaseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "즉시 구매가"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        return label
    }()
    
    // 상품 가격 라벨
    private lazy var goodsPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "228,000원"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
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
    
    // 저장 버튼
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "icon_notSaved") // 저장 버튼 이미지
        configuration.imagePlacement = .top
        configuration.imagePadding = 1 // 이미지와 텍스트 간 간격 축소
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        configuration.attributedTitle = AttributedString("2,122", attributes: AttributeContainer([
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 12, weight: .regular)
        ]))
        
        button.configuration = configuration
        return button
    }()
    // 즉시 구매 버튼
    public let nowBuyButton: PurchaseButton = PurchaseButton(frame: .zero, btnType: .buy)
    // 즉시 판매 버튼
    public let nowSellButton: PurchaseButton = PurchaseButton(frame: .zero, btnType: .sell)
    // 버튼 텍스트 및 스타일 설정
    private func setupButtonTexts() {
        nowBuyButton.priceLabel.text = "345,000"
        nowBuyButton.subLabel.text = "즉시 구매가"
        
        nowSellButton.priceLabel.text = "396,000"
        nowSellButton.subLabel.text = "즉시 판매가"
    }
    
    // 하단 버튼 뷰
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        // 저장 버튼 추가
        view.addSubview(saveButton)
        
        // 버튼 스택뷰 생성
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 6
        buttonStackView.distribution = .fillEqually // 버튼 크기 자동 균등 분배
        
        // 버튼 추가
        buttonStackView.addArrangedSubview(nowBuyButton)
        buttonStackView.addArrangedSubview(nowSellButton)
        setupButtonTexts()
        
        view.addSubview(buttonStackView)
        
        // 저장 버튼 제약 조건
        saveButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.width.height.equalTo(40)
        }
        
        // 스택뷰 제약 조건
        buttonStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(saveButton.snp.right).offset(21)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
        
        return view
    }()
    
    // 컴포넌트 추가
    private func addComponents() {
        addSubview(productImageView)
        addSubview(jacketsCollectionView)
        addSubview(productEngNameLabel)
        addSubview(productKorNameLabel)
        addSubview(purchaseTitleLabel)
        addSubview(goodsPriceLabel)
        addSubview(bottomView)
    }
    
    // 레이아웃 설정
    private func setupConstraints() {
        productImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(5)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(373)
        }
        
        jacketsCollectionView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }
        
        purchaseTitleLabel.snp.makeConstraints {
            $0.top.equalTo(jacketsCollectionView.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
        }
        
        goodsPriceLabel.snp.makeConstraints {
            $0.top.equalTo(purchaseTitleLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(16)
        }
        
        productEngNameLabel.snp.makeConstraints {
            $0.top.equalTo(goodsPriceLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
        }
        
        productKorNameLabel.snp.makeConstraints {
            $0.top.equalTo(productEngNameLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(16)
        }
        
        bottomView.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
}
