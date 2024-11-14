//  HomeView.swift
//  Kream

import UIKit
import SnapKit
import Then

class HomeView: UIView {
    //TODO: - 검색창 모양&알림버튼 구현할것
    let searchBarView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor(named: "F5F5F5")
        view.layer.cornerRadius = 12
        return view
    }()
    //MARK: - segmentControl
    //TODO: - 밑줄 제외 구현 완료
    let titles = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
    lazy var segmentedControl = UISegmentedControl(items: titles).then{
        /// normal인 경우
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        /// selected인 경우
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
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
    
    //MARK: - underline이동
    private let underlineView = UIView().then {
        $0.backgroundColor = .black // 밑줄 색상
    }
    
    //MARK: - 추천탭 광고이미지
    let recommendImg = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "image_ad_none")
    }
    
    //MARK: - collectionView
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical // 세로 스크롤 설정
        $0.minimumInteritemSpacing = 9
        $0.minimumLineSpacing = 10 // 줄 간 간격 설정
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false // 스크롤을 막아 2줄로 제한
        $0.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
    }
    //MARK: - emptyLabel
    let emptyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.textColor = .black
        $0.text = "none"
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
            searchBarView,
            segmentedControl,
            underlineView,
            recommendImg,
            menuCollectionView,
            emptyLabel
        ].forEach { addSubview($0) }
        
        searchBarView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(8)
            $0.leading.equalToSuperview().offset(16) // 좌측 여백 설정
            $0.trailing.equalToSuperview().offset(-16) // 우측 여백 설정
            $0.height.equalTo(40) // 높이 설정
        }

        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom).offset(12) // searchBarView 아래에 위치
            $0.leading.equalToSuperview().offset(16) // 좌측 여백 설정
            $0.trailing.equalToSuperview().offset(-16) // 우측 여백 설정
            $0.height.equalTo(30) // 높이 설정
        }

        recommendImg.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(12) // segmentedControl 아래에 위치
            $0.leading.trailing.equalToSuperview() // 화면 전체 너비에 맞춤
            $0.height.equalTo(374) // 높이 설정 (이미지 크기에 맞게 조정 가능)
        }

        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(recommendImg.snp.bottom).offset(20) // recommendImg 아래에 위치
            $0.leading.equalToSuperview().offset(16) // 좌측 여백 설정
            $0.trailing.equalToSuperview().offset(-16) // 우측 여백 설정
            $0.height.equalTo(182)
        }
        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        
    }

}
