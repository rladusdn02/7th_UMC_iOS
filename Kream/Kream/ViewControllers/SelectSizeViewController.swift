//
//  SelectSizeViewController.swift
//  Kream

import UIKit

class SelectSizeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view = SelectSizeView()
    }
    
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
    
}
