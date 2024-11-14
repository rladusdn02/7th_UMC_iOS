//
//  ProductModel.swift
//  Kream

import UIKit

struct Product {
    let imageName: String
    let title: String
    let subtitle: String
    let price: String
    let transactionInfo: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
}
