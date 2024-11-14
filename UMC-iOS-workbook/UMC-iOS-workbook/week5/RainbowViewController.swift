//
//  RainbowViewController.swift
//  UMC-iOS-workbook
//
//  Created by 김연우 on 11/14/24.
//

import UIKit

class RainbowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = RainbowView(frame: self.view.bounds)
    }

}
