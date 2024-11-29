//
//  SavedCell.swift
//  Kream
//
//  Created by 김연우 on 10/9/24.
//

import UIKit
import SnapKit

class SavedCell: UITableViewCell {
    
    //MARK: - 기본 세팅
    
    //테이블 뷰에서 Cell을 연결하기 위한 식별자
    static let identifier = "SavedCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstaints()
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            self.goodsImageView.image = nil
            self.goodsName.text = nil
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    // 타 파일(GoodsModel)에서 Cell에 접근할 수 있도록 하는 public 부분
    public func configure(model: GoodsModel) {
            self.goodsImageView.image = UIImage(named: model.goodsImg)
            self.goodsName.text = model.goodsName
        }
    // MARK: - 컴포넌트 작성
    private lazy var goodsImageView: UIImageView = {
            let imageView = UIImageView()
            
            /* 상품의 이미지 값은 ViewController에서 작성 */
            // imageView.image = UIImage(named: "여기에 더미 데이터 값이 들어갑니다.")
            
            return imageView
        }()
        
        private lazy var goodsName: UILabel = {
            let name = UILabel()
            name.font = UIFont.systemFont(ofSize: 12)
            name.textColor = UIColor.black
            
            /* 상품의 이름 값은 ViewController에서 작성 */
            //name.text = "여기에 더미 데이터 값이 들어갑니다."
            
            return name
        }()
        
        private func setViews() {
            self.addSubview(goodsImageView)
            self.addSubview(goodsName)
        }
        
        private func setConstaints() {
            goodsImageView.snp.makeConstraints {
                $0.top.equalToSuperview().offset(11)
                $0.left.equalToSuperview().offset(13)
                $0.bottom.equalToSuperview().offset(-10)
                $0.width.height.equalTo(75)
            }
            
            goodsName.snp.makeConstraints {
                $0.top.equalToSuperview().offset(36.5)
                $0.left.equalTo(goodsImageView.snp.right).offset(87)
                $0.right.equalToSuperview().offset(-144)
            }
        }
}
