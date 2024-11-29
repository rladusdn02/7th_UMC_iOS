//
//  SelectSizeViewController.swift
//  Kream

import UIKit

class SelectSizeViewController: UIViewController {
    
    private let rootView = SelectSizeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view = rootView
        setupCollectionView()
    }
    //TODO: - navigation bar subTitle 구현하기
    private func setupNavigationBar() {
        navigationItem.title = "구매하기"
        let xButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(handleXButtonTapped)
        )
        self.navigationItem.rightBarButtonItem = xButton
        self.navigationController?.navigationBar.tintColor = .black // 화살표 색상 설정
    }
    
    @objc private func handleXButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupCollectionView(){
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
    }
    
}

extension SelectSizeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SizeDatas.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SizeCollectionViewCell.identifier,
            for: indexPath
        ) as? SizeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = SizeDatas.dummy()
        cell.sizeLabel.text = list[indexPath.row].size
        cell.priceLabel.text = list[indexPath.row].price
        
        // 초기 상태: 선택 해제
        cell.setClickAction(isSelected: false)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard let cell = collectionView.cellForItem(at: indexPath) as? SizeCollectionViewCell else { return }
            
            // 선택된 셀 강조
            cell.setClickAction(isSelected: true)
        }
        
        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            guard let cell = collectionView.cellForItem(at: indexPath) as? SizeCollectionViewCell else { return }
            
            // 선택 해제된 셀 원래 상태로
            cell.setClickAction(isSelected: false)
        }
}
