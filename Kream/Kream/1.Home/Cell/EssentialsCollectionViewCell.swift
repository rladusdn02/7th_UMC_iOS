//
//  EssentialsCollectionViewCell.swift
//  Kream
//

import UIKit
import SnapKit

class EssentialsCollectionViewCell: UICollectionViewCell {
    static let identifier = "EssentialsCollectionViewCell"
    
    private let essentialsImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private let usernameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .white
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        $0.textAlignment = .center
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(essentialsImageView)
        essentialsImageView.addSubview(usernameLabel)
        
        essentialsImageView.snp.makeConstraints {
            $0.edges.equalToSuperview() // 셀 전체를 이미지로 채우기
        }
        
        usernameLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.height.equalTo(20)
        }
    }
    
    // 데이터를 설정할 메서드
    func configure(with essential: Essential) {
        essentialsImageView.image = essential.image
        usernameLabel.text = essential.username
    }
}
