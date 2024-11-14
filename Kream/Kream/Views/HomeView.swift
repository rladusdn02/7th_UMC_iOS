// HomeView.swift
// Kream

import UIKit
import SnapKit
import Then

class HomeView: UIView {
    // MARK: - scrollView 설정
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    // Content View를 만들어 ScrollView 안에 넣을 View 생성
    private let contentView = UIView()
    
    //TODO: - 검색창 모양 & 알림 버튼 구현할것
    let searchBarView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor(named: "F5F5F5")
        view.layer.cornerRadius = 12
        return view
    }()
    
    // MARK: - Segment Control (추천, 랭킹, 발매정보 등)
    let titles = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
    lazy var segmentedControl = UISegmentedControl(items: titles).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes([
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 16, weight: .light)
        ], for: .normal)
        $0.setTitleTextAttributes([
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 16, weight: .bold)
        ], for: .selected)
    }
    
    // 추천 탭 광고 이미지
    let recommendImg = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "image_ad_none")
    }
    
    // Segment Control 아래의 밑줄
    private let underlineView = UIView().then {
        $0.backgroundColor = .black
    }
    
    // MARK: - 발매 상품 컬렉션 뷰 (Just Dropped)
    let releaseCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 8
        $0.minimumLineSpacing = 10
    }).then {
        $0.backgroundColor = .clear
        $0.register(ReleaseCollectionViewCell.self, forCellWithReuseIdentifier: ReleaseCollectionViewCell.identifier)
    }
    
    // MARK: - 연말 필수템 모음 컬렉션 뷰 (Essentials)
    let essentialsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 8
        $0.minimumLineSpacing = 10
    }).then {
        $0.backgroundColor = .clear
        $0.register(EssentialsCollectionViewCell.self, forCellWithReuseIdentifier: EssentialsCollectionViewCell.identifier)
    }
    
    // 메뉴 컬렉션 뷰 (추천 카테고리 메뉴)
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        $0.minimumInteritemSpacing = 9
        $0.minimumLineSpacing = 10
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false // 스크롤을 막아 2줄로 제한
        $0.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
    }
    
    // 빈 상태 표시를 위한 레이블
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
    
    // MARK: - Setup View 구성
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [
            searchBarView,
            segmentedControl,
            underlineView,
            recommendImg,
            menuCollectionView,
            emptyLabel,
            releaseCollectionView,
            essentialsCollectionView
        ].forEach { contentView.addSubview($0) }
        
        // ScrollView 및 ContentView의 레이아웃 설정
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview() // 세로 스크롤을 위한 ContentView의 너비 고정
        }
        
        // 검색창 설정
        searchBarView.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(40)
        }
        
        // Segment Control 설정
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(30)
        }
        
        // 밑줄 설정
        underlineView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.leading.equalTo(segmentedControl)
            $0.trailing.equalTo(segmentedControl)
            $0.height.equalTo(2)
        }
        
        // 추천 이미지 설정
        recommendImg.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(374)
        }
        
        // 추천 카테고리 메뉴 CollectionView
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(recommendImg.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(182)
        }
        
        // 발매 상품 CollectionView (Just Dropped)
        releaseCollectionView.snp.makeConstraints {
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(20)
            $0.leading.equalTo(contentView).offset(16)
            $0.trailing.equalTo(contentView).offset(-16)
            $0.height.equalTo(200)
        }
        
        // 연말 필수템 모음 CollectionView
        essentialsCollectionView.snp.makeConstraints {
            $0.top.equalTo(releaseCollectionView.snp.bottom).offset(20)
            $0.leading.equalTo(contentView).offset(16)
            $0.trailing.equalTo(contentView).offset(-16)
            $0.height.equalTo(200)
            $0.bottom.equalTo(contentView).offset(-20) // 마지막 뷰의 하단을 ContentView의 하단에 맞춤
        }
        
        // Empty 상태 레이블 위치
        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
