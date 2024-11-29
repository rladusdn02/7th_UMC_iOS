//
//  SizeCollectionViewCell.swift
//  Kream

import UIKit
import SnapKit

class SizeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SizeCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonSetting() // 초기화 시 모양 설정
        addSubviews() // 레이블 추가
        setupConstraints() // 레이아웃 설정
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 사이즈 라벨
    public lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center // 텍스트 가운데 정렬
        return label
    }()
    
    // 가격 라벨
    public lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .red
        label.textAlignment = .center // 텍스트 가운데 정렬
        return label
    }()
    
    // 모양 설정
    private func buttonSetting() {
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
    
    // 클릭 설정
    public func setClickAction(isSelected: Bool) {
        if isSelected {
            self.sizeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            self.priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            self.layer.borderColor = UIColor.black.cgColor
        } else {
            self.sizeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            self.priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            self.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    // 레이블 추가
    private func addSubviews() {
        addSubview(sizeLabel)
        addSubview(priceLabel)
    }
    
    // 레이아웃 설정
    private func setupConstraints() {
        sizeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.right.equalToSuperview().inset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(sizeLabel.snp.bottom).offset(4)
            $0.left.right.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
}
