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
        
        // 예제 데이터
        let sizes = ["S", "M", "L", "XL", "XXL"]
        cell.sizeLabel.text = sizes[indexPath.row]
        cell.priceLabel.text = "360,000원"
        
        return cell
    }
}
