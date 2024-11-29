//
//  JacketsCell.swift
//  Kream
//
//  Created by 김연우 on 11/29/24.
//

import UIKit
import SnapKit

class JacketsCollectionViewCell: UICollectionViewCell {
    static let identifier = "JacketsCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(jacketsView)
        jacketsView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(53)
        }
    }
    public let jacketsView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 0
        $0.clipsToBounds = true
    }
}
