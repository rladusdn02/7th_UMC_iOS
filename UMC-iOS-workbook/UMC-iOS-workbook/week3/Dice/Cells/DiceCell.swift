//
//  DiceCell.swift
//  UMC-iOS-workbook
//
//  Created by 김연우 on 10/9/24.
//

import UIKit
import SnapKit

class DiceCell: UITableViewCell {
    
    //cell 식별자 넣기
    static let identifier = "DiceCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //TableViewCell 초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        // 셀 초기화 할 때 호출되는 메서드
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstaints()
    }
    // 셀이 재사용되기 전에 초기화된 상태로 만들어줌
    override func prepareForReuse() {
        super.prepareForReuse()
        self.diceImageView.image = nil
        self.diceName.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var diceImageView: UIImageView = {
        let imageView = UIImageView()
        
        /* 주사위 이미지 값은 ViewController에서 작성하게 됩니다. */
        // imageView.image = UIImage(named: "여기에 더미 데이터 값이 들어갑니다.")
        
        return imageView
    }()
    
    private lazy var diceName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 20)
        name.textColor = UIColor.black
        
        /* 주사위 이름 값은 ViewController에서 작성하게 됩니다. */
        //name.text = "여기에 더미 데이터 값이 들어갑니다."
        
        return name
    }()
    
    private func setViews() {
        self.addSubview(diceImageView)
        self.addSubview(diceName)
    }
    
    private func setConstaints() {
        diceImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.height.equalTo(75)
        }
        
        diceName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36.5)
            $0.left.equalTo(diceImageView.snp.right).offset(87)
            $0.right.equalToSuperview().offset(-144)
        }
    }
    
    public func configure(model: DiceModel) {
        self.diceImageView.image = UIImage(named: model.diceImage)
        self.diceName.text = model.diceName
    }
}
