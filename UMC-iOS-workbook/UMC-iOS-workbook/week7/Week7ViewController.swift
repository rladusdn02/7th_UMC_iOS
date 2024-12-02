//
//  ViewController.swift
//  UMC-iOS-workbook
//
//  Created by 김연우 on 12/2/24.
//

import UIKit

class Week7ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = testView
    
    }
    
    private lazy var testView: APITestView = {
        let view = APITestView()
        view.searchButton.addTarget(self, action: #selector(searchText), for: .touchUpInside)
        return view
    }()
    
    @objc private func searchText() {
        let query = testView.searchTextField.text ?? ""
        search(query: query)
    }
    
    private func search(query: String) {
        let url = "https://dapi.kakao.com/v2/search/web"
        let parameters: [String: Any] = ["query": query]
        
        APIClient.shared.request(url, method: .get, parameters: parameters) { (result: Result<SearchModel, Error>) in
            switch result {
            case .success(let response):
                self.updateView(response)
            case .failure(let error):
                print("네트워킹 오류: \(error)")
            }
            
        }
    }
    
    private func updateView(_ model: SearchModel) {
        testView.responseTitle.text = model.documents.first?.title
        testView.responseContentsTitle.text = model.documents.first?.contents
    }
}
