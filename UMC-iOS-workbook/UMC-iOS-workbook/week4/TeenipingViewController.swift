//  TeenipingViewController.swift
//  UMC-iOS-workbook

import UIKit

class TeenipingViewController: UIViewController {
    private let rootView = TeenipingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
        setupAction()
        setupDelegate()
    }
    /// addTarget을 연결할 setupAction()을 선언.segmentedControl의 인덱스가 바뀌었을 때(.valueChanged) 실행될 segmentedControlValueChanged()를 연결
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            /// UISegmentedControl의 인덱스 값이 업데이트 되었을 때 실행될 메서드를 선언 및 연결, 매개변수 'segment'
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    private func setupDelegate() {
        rootView.teenipingCollectionView.dataSource = self
    }
    
    @objc
        private func segmentedControlValueChanged(segment: UISegmentedControl) {
            if segment.selectedSegmentIndex == 0 {
                rootView.teenipingCollectionView.isHidden = false
                rootView.emptyLabel.isHidden = true
            }
            else {
                rootView.teenipingCollectionView.isHidden = true
                rootView.emptyLabel.isHidden = false
            }
        }
    
}

extension TeenipingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /// TeenipingModel.dummy() 의 갯수만큼 데이터를 바인딩하므로 TeenipingModel.dummy().count 를 반환
        return TeenipingModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// `cell`을 선언하고 만약 셀의 값이 nil일 경우 `UICollectionViewCell`을 반환해주도록 선언. 이 때 `dequeueReusableCell()`을 이용 -> 재사용 큐에서 필요한 `cell`을 `dequeue` 하기 위한 함수
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TeenipingCollectionViewCell.identifier,
            for: indexPath
        ) as? TeenipingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = TeenipingModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        
        return cell
    }
}
