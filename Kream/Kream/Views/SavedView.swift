//
//  SavedView.swift
//  Kream
//
//  Created by 김연우 on 10/9/24.
//

import UIKit
import SnapKit

class SavedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Saved 탭 화면 구성
    // TODO: - 한 화면에 표시되지 않는 경우 scroll가능하도록 수정
    private func setViews(){
        self.addSubview(titleLabel)
        self.addSubview(goodsCountLabel)
        self.addSubview(tableView)
    }
    private func setConstraints(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(10)
            $0.height.equalTo(45)
        }
        goodsCountLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(13)
            $0.width.equalTo(55)
            $0.height.equalTo(22)
        }
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(156)
            $0.left.right.bottom.equalToSuperview()
            $0.width.equalTo(393)
            $0.height.equalTo(99)
        }
    }

    
    // MARK: - 상단 정보
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        return label
    }()
    // TODO: - countlabel 구현할것
    private lazy var goodsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 8개"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    // MARK: - 하단 TableCell 구현
    public lazy var tableView: UITableView = {
        let table = UITableView()
        //cell에서 identify해두었던 이름으로 접근
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
}
