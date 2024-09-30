//
//  CountUpDownView.swift
//  Kream
//
//  Created by 김연우 on 9/23/24.
//

import UIKit

class CountUpDownView: UIView {

    override init(frame: CGRect) {
            super.init(frame: frame) //뷰를 생성
            self.backgroundColor = .white
            self.addComponents()
        }
        
        required init?(coder: NSCoder) {
            //스토리보드에서는 지원 불가하는 기능 설정
            fatalError("init(coder:) has not been implemented")
        }
    // 카운트 표시 라벨
        public lazy var countLabel: UILabel = {
            let label = UILabel()
            
            label.font = UIFont.systemFont(ofSize: 42, weight: .bold)
            label.textColor = UIColor.black
            label.textAlignment = .center
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
    // 버튼 내부 텍스트 폰트 지정 컨테이너
       private lazy var titleContainer: AttributeContainer = {
           var container = AttributeContainer()
           container.font = UIFont.systemFont(ofSize: 16, weight: .bold)
           container.foregroundColor = UIColor.black
           return container
       }()
       
       // 숫자 업 버튼
       public lazy var countUpButton: UIButton = {
           let btn = UIButton()
           
           var configuration = UIButton.Configuration.plain()
           
           configuration.image = UIImage(systemName: "arrowtriangle.up.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
           configuration.imagePlacement = .top
           configuration.imagePadding = 5
           
           configuration.attributedTitle = AttributedString("숫자 올리기", attributes: titleContainer)
           configuration.titleAlignment = .center
           
           btn.configuration = configuration
           btn.translatesAutoresizingMaskIntoConstraints = false
           
           return btn
       }()
       
       // 숫자 다운 버튼
       public lazy var countDownButton: UIButton = {
           let btn = UIButton()
           
           var configuration = UIButton.Configuration.plain()
           
           configuration.image = UIImage(systemName: "arrowtriangle.down.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
           configuration.imagePlacement = .top
           configuration.imagePadding = 5
           
           configuration.attributedTitle = AttributedString("숫자 내리기", attributes: titleContainer)
           configuration.titleAlignment = .center
           
           btn.configuration = configuration
           btn.translatesAutoresizingMaskIntoConstraints = false
           
           return btn
       }()
    private func addComponents() {
        self.addSubview(countLabel)
                self.addSubview(countDownButton)
                self.addSubview(countUpButton)
                
                
                NSLayoutConstraint.activate([ //autolayout 지정
                    countLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 362),
                    countLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 111),
                    countLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -111),
                    
                    countDownButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 17),
                    countDownButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 93.5),
                    
                    countUpButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 17),
                    countUpButton.leftAnchor.constraint(equalTo: countDownButton.rightAnchor, constant: 7)
                    ])
        }
}
