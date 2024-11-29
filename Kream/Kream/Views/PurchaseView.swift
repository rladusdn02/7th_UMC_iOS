import UIKit
import SnapKit

// 버튼 타입 정의
enum PurchaseButtonType {
    case buy
    case sell
}

// 커스텀 버튼 클래스
class PurchaseButton: UIButton {
    let priceLabel = UILabel()
    let subLabel = UILabel()
    
    init(frame: CGRect, btnType: PurchaseButtonType) {
        super.init(frame: frame)
        
        // 버튼 스타일 설정
        self.backgroundColor = btnType == .buy ? UIColor.systemRed : UIColor.systemGreen
        self.layer.cornerRadius = 8
        
        // 가격 레이블
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.textColor = .white
        priceLabel.textAlignment = .center
        
        // 서브 타이틀 레이블
        subLabel.font = UIFont.systemFont(ofSize: 12)
        subLabel.textColor = .white
        subLabel.textAlignment = .center
        
        // 버튼에 레이블 추가
        addSubview(priceLabel)
        addSubview(subLabel)
        
        // 레이블 레이아웃 설정
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
    public let jacketsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width:53, height:53)
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(JacketsCollectionViewCell.self, forCellWithReuseIdentifier: JacketsCollectionViewCell.identifier)
    }
    
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
    
    // 하단 버튼 뷰
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear

        // 저장 버튼
        let saveButton = self.saveButton
        view.addSubview(saveButton)

        // 버튼 스택뷰 생성
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 6
        buttonStackView.distribution = .fillEqually // 버튼 크기 자동 균등 분배

        // 즉시 구매 버튼
        let nowBuyButton = bottomButtons(type: true, price: "345,000", subTitle: "즉시 구매가")
        // 즉시 판매 버튼
        let nowSellButton = bottomButtons(type: false, price: "396,000", subTitle: "즉시 판매가")

        // 버튼을 스택뷰에 추가
        buttonStackView.addArrangedSubview(nowBuyButton)
        buttonStackView.addArrangedSubview(nowSellButton)

        view.addSubview(buttonStackView)

        // 저장 버튼 제약 조건
        saveButton.snp.makeConstraints {
            $0.centerY.equalToSuperview() // 수직 가운데 정렬
            $0.left.equalToSuperview().offset(16) // 왼쪽 여백
            $0.width.height.equalTo(40) // 버튼 크기 명확히 지정 (너비와 높이를 동일하게)
        }

        // 스택뷰 제약 조건
        buttonStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview() // 수직 가운데 정렬
            $0.left.equalTo(saveButton.snp.right).offset(21) // 저장 버튼 오른쪽에 위치
            $0.right.equalToSuperview().offset(-10) // 오른쪽 여백
            $0.height.equalTo(50) // 버튼 높이 고정
        }

        return view
    }()
    
    // 버튼 생성 함수
    private func bottomButtons(type: Bool, price: String, subTitle: String) -> PurchaseButton {
        let btnType: PurchaseButtonType = type ? .buy : .sell
        let button = PurchaseButton(frame: .zero, btnType: btnType)
        
        button.priceLabel.text = price
        button.subLabel.text = subTitle
        
        return button
    }
    
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
            $0.top.equalTo(productKorNameLabel.snp.bottom).offset(50)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
}
