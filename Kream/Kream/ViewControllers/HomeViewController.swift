//
//  HomeViewController.swift
//  Kream
//
//  Created by 김연우 on 10/2/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let rootView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
        setupAction()
        setupDelegate()
    }
    //MARK: - 위에 segment가 변할때마다 비춰질 view들
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    //MARK: - setupDelegate
    private func setupDelegate(){
        rootView.menuCollectionView.dataSource = self
        rootView.menuCollectionView.delegate = self
    }
    
    @objc
        private func segmentedControlValueChanged(segment: UISegmentedControl) {
            ///추천탭눌렀을때
            if segment.selectedSegmentIndex == 0 {
                rootView.recommendImg.isHidden = false
                rootView.menuCollectionView.isHidden = false
                rootView.emptyLabel.isHidden = true
            }
            ///아닌경우
            else {
                rootView.recommendImg.isHidden = true
                rootView.menuCollectionView.isHidden = true
                rootView.emptyLabel.isHidden = false
            }
        }
}
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeMenuModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuCollectionViewCell.identifier,
            for: indexPath
        ) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = HomeMenuModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = 4 * 9 // 5개의 아이템을 위한 4개의 간격
        let itemWidth = (collectionView.frame.width - CGFloat(totalSpacing)) / 5 // 셀 너비 계산
        return CGSize(width: itemWidth, height: itemWidth) // 정사각형 셀
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9 // 아이템 간 간격
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 // 행 간 간격
    }
}
