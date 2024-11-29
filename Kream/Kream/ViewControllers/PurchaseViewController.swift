//
//  PurchaseViewController.swift
//  Kream
//
//  Created by 김연우 on 11/22/24.
//

import UIKit
import Then

class PurchaseViewController: UIViewController {
    private let rootView = PurchaseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
        view = rootView
        
        setupDelegate()
    }
    
    private func setupNavigationBar(){
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(handleBackButtonTapped) // 버튼 클릭 시 호출될 메서드
        )
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = .black // 화살표 색상 설정
    }
    @objc private func handleBackButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        }
    
    private func setupDelegate() {
        rootView.jacketsCollectionView.dataSource = self
    }
    
}

extension PurchaseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JacketsModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: JacketsCollectionViewCell.identifier,
            for: indexPath
        ) as? JacketsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = JacketsModel.dummy()
        
        cell.jacketsView.image = list[indexPath.row].image
        
        return cell
    }
}
