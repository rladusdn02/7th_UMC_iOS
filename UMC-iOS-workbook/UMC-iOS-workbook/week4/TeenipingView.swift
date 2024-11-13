//  TeenipingView.swift
//  UMC-iOS-workbook

import UIKit
import SnapKit
import Then

class TeenipingView: UIView {
    /// 티니핑, not티니핑을 눌렀을 때 화면에 나타나는 컴포넌트를 바꿔줄 SegmentControl
    let segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then {
        /// for: [경우] 에 따라 뒷배경 여부를 설정해주기 위해, UIImage()로 설정
        /// normal인 경우
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        /// selected인 경우
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        /// highlighted인 경우
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        /// UISegmentedControl의 세그먼트는 선언 순서대로 인덱스가 부여되므로, 초기 선택 인덱스를 설정
        $0.selectedSegmentIndex = 0
        /// selected인 경우, normal인 경우 TextAttribute를 지정
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }
    
    /// 티니핑들의 정보를 표시해줄 UICollectionView
    let teenipingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        /// 각 셀의 사이즈를 FlowLayout에 설정
        $0.itemSize = CGSize(width: 162, height: 144)
        /// 제약조건을 충돌 없이 잘 설정하면 automaticSize도 사용 가능
//        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.minimumInteritemSpacing = 12
    }).then {
        /// CollectionView의 속성 설정
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(TeenipingCollectionViewCell.self, forCellWithReuseIdentifier: TeenipingCollectionViewCell.identifier)
    }
    
    /// segmentedControl과 teenipingCollectionView, emptyLabel을 구분해줄 UIView
    private let divideLine = UIView().then {
        $0.backgroundColor = .black
    }
    
    /// not 티니핑을 눌렀을 때 나타날 휑~ UILabel
    let emptyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.textColor = .black
        $0.text = "휑~"
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [
            segmentedControl,
            teenipingCollectionView,
            divideLine,
            emptyLabel
        ].forEach {
            addSubview($0)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            /// 커스텀하면서 segmentedControl의 가로 길이가 늘어날 예정이기 때문에 길이를 제한하지 않도록 미리 설정
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        teenipingCollectionView.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.height.equalTo(612)
            $0.bottom.equalToSuperview().inset(74)
        }
        
        emptyLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(301)
            $0.centerX.equalToSuperview()
        }
        
        
    }
}
