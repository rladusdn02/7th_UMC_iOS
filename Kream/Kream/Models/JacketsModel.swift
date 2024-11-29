//
//  JacketsModel.swift
//  Kream

import UIKit

struct JacketsModel{
    let image: UIImage
}

extension JacketsModel {
    static func dummy() -> [JacketsModel] {
        return [
            JacketsModel(image: .jacket1),
            JacketsModel(image: .jacket2),
            JacketsModel(image: .jacket3),
            JacketsModel(image: .jacket4),
            JacketsModel(image: .jacket5),
            JacketsModel(image: .jacket6),
            JacketsModel(image: .jacket7)
        ]
    }
}

