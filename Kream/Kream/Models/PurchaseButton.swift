//
//  BottomButton.swift
//  Kream
//
//  Created by 김연우 on 11/29/24.
//

import UIKit
import SnapKit

// 버튼 타입 정의
enum PurchaseButtonType {
    case buy
    case sell
    case fastShip
    case generalShip
}

// 커스텀 버튼 클래스
class PurchaseButton: UIButton {
    let priceLabel = UILabel()
    let subLabel = UILabel()
    
    init(frame: CGRect, btnType: PurchaseButtonType) {
        super.init(frame: frame)
        
        // 버튼 스타일 설정 및 subtitle 색상 설정
        switch btnType {
        case .buy:
            self.backgroundColor = UIColor.systemRed
            priceLabel.font = UIFont.boldSystemFont(ofSize: 13)
            subLabel.textColor = UIColor(red: 0.639, green: 0.216, blue: 0.137, alpha: 1)
        case .sell:
            self.backgroundColor = UIColor.systemGreen
            priceLabel.font = UIFont.boldSystemFont(ofSize: 13)
            subLabel.textColor = UIColor(red: 0.122, green: 0.467, blue: 0.271, alpha: 1)
        case .fastShip:
            self.backgroundColor = UIColor.systemRed
            priceLabel.font = UIFont.boldSystemFont(ofSize: 14)
            subLabel.textColor = UIColor(red: 1, green: 0.792, blue: 0.725, alpha: 1)
        case .generalShip:
            self.backgroundColor = UIColor.black
            priceLabel.font = UIFont.boldSystemFont(ofSize: 14)
            subLabel.textColor = UIColor(red: 0.886, green: 0.886, blue: 0.886, alpha: 1)
        }
        self.layer.cornerRadius = 8
        
        // 가격 레이블
        
        priceLabel.textColor = .white
        priceLabel.textAlignment = .center
        
        // 서브 타이틀 레이블
        subLabel.font = UIFont.systemFont(ofSize: 10)
        subLabel.textAlignment = .center
        
        // 버튼에 레이블 추가
        addSubview(priceLabel)
        addSubview(subLabel)
        
        // 레이블 레이아웃 설정
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
