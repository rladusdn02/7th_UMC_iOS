//
//  HomeViewController.swift
//  Kream
//

import UIKit

class HomeViewController: UIViewController {
    private let rootView = HomeView()
    
    // 샘플 데이터
    private let releaseProducts = [
        Product(imageName: "mlb_shoe", title: "MLB", subtitle: "청키라이너 뉴욕양키스", price: "139,000원", transactionInfo: "즉시 구매가"),
        Product(imageName: "jordan_shoe", title: "Jordan", subtitle: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원", transactionInfo: "즉시 구매가"),
        Product(imageName: "humanMade", title: "Human Made", subtitle: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원", transactionInfo: "즉시 구매가")
    ]
    
    private let essentials = [
        Essential(imageName: "katarina", username: "@katarinabluu"),
        Essential(imageName: "imwinter", username: "@imwinter"),
        Essential(imageName: "thousandwoo", username: "@thousand_woo")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
        setupAction()
        setupDelegate()
    }
    
    // MARK: - Segmented Control Action
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    // MARK: - Setup Delegate
    private func setupDelegate() {
        rootView.menuCollectionView.dataSource = self
        rootView.menuCollectionView.delegate = self
        rootView.releaseCollectionView.dataSource = self
        rootView.releaseCollectionView.delegate = self
        rootView.essentialsCollectionView.dataSource = self
        rootView.essentialsCollectionView.delegate = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            rootView.recommendImg.isHidden = false
            rootView.menuCollectionView.isHidden = false
            rootView.emptyLabel.isHidden = true
        } else {
            rootView.recommendImg.isHidden = true
            rootView.menuCollectionView.isHidden = true
            rootView.emptyLabel.isHidden = false
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == rootView.menuCollectionView {
            return HomeMenuModel.dummy().count
        } else if collectionView == rootView.releaseCollectionView {
            return releaseProducts.count
        } else if collectionView == rootView.essentialsCollectionView {
            return essentials.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == rootView.menuCollectionView {
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
            
        } else if collectionView == rootView.releaseCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ReleaseCollectionViewCell.identifier,
                for: indexPath
            ) as? ReleaseCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: releaseProducts[indexPath.item])
            return cell
            
        } else if collectionView == rootView.essentialsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: EssentialsCollectionViewCell.identifier,
                for: indexPath
            ) as? EssentialsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: essentials[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == rootView.menuCollectionView {
            let totalSpacing = 4 * 9
            let itemWidth = (collectionView.frame.width - CGFloat(totalSpacing)) / 5
            return CGSize(width: itemWidth, height: itemWidth)
            
        } else if collectionView == rootView.releaseCollectionView {
            return CGSize(width: 150, height: 200)
            
        } else if collectionView == rootView.essentialsCollectionView {
            return CGSize(width: 100, height: 150)
        }
        
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // essentialsCollectionView에서 특정 셀을 클릭한 경우
        if collectionView == rootView.essentialsCollectionView {
            let purchaseVC = PurchaseViewController()
            let navigationController = UINavigationController(rootViewController: purchaseVC)
            print("purchase로 넘어감")
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        }
    }
}
