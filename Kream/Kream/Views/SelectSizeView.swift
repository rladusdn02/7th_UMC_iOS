//
//  SelectSizeView.swift
//  Kream

import UIKit

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
    //빠른배송 버튼
    public let fastButton: PurchaseButton = PurchaseButton(frame: .zero, btnType: .buy)
    //일반배송 버튼
    public let generalButton: PurchaseButton = PurchaseButton(frame: .zero, btnType: .general)
    
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
            $0.height.equalTo(50)
        }
        
        return view
    }()
    private func addConponents(){
        addSubview(bottomView)
    }
    
    private func setupConstraints(){
        bottomView.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
}
