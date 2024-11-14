//  EssentialModel.swift
//  Kream

import UIKit

struct Essential {
    let imageName: String
    let username: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
}


