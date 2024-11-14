//
//  MenuCollectionViewCell.swift
//  Kream

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MenuCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 30.5
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
        $0.text = "메뉴"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(61)
        }
        //FIXME: - 타이틀라벨 사라짐
        //TODO: - 검색바 만들기, 알림아이콘만들기, 광고이미지 수정
        titleLabel.snp.makeConstraints {
                $0.top.equalTo(imageView.snp.bottom).offset(6) // imageView와의 간격을 6으로 설정
                $0.centerX.equalToSuperview() // 수평 중앙에 배치
            }
    }
}
