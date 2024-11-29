//
//  SavedViewController.swift
//  Kream
//
//  Created by 김연우 on 10/2/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    //더미 데이터 받아오기
    let data = dummySavedModel.savedDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    private lazy var savedView: SavedView = {
        let view = SavedView()
        print("savedView 선택")
        view.tableView.dataSource = self
        return view
    }()
}
// MARK: - Extention
// 구현해야하는 메서드가 구현되어있지 않기 때문에, 코드 외부에서 dataSource와 delegate를 구현
extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueReusableCell 메서드를 통해 재사용
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
                return UITableViewCell()
        }
        // data의 항목 셀에 설정
        cell.configure(model: data[indexPath.row])
        return cell
    }
    
}
