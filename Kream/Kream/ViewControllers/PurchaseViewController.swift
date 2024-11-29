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
        view.backgroundColor = .white
        view = rootView
        
        setupDelegate()
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
