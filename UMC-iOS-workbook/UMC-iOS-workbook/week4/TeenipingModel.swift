//  TeenipingModel.swift
//  UMC-iOS-workbook

import UIKit

struct TeenipingModel {
    let image: UIImage
    let name: String
}

extension TeenipingModel {
    static func dummy() -> [TeenipingModel] {
        return [
            TeenipingModel(image: .heartsping, name: "하츄핑"),
            TeenipingModel(image: .lalaping, name: "라라핑"),
            TeenipingModel(image: .baroping, name: "바로핑"),
            TeenipingModel(image: .azaping, name: "아자핑"),
            TeenipingModel(image: .chachaping, name: "차차핑"),
            TeenipingModel(image: .happing, name: "해핑"),
            TeenipingModel(image: .mugeoping, name: "무거핑"),
            TeenipingModel(image: .shireoping, name: "시러핑")
        ]
    }
}
