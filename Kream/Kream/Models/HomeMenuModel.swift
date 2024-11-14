//
//  HomeMenusModel.swift
//  Kream

import UIKit

struct HomeMenuModel {
    let image: UIImage
    let name: String
}

extension HomeMenuModel {
    static func dummy() -> [HomeMenuModel] {
        return [
            HomeMenuModel(image: .kreamDraw, name: "크림드로우"),
            HomeMenuModel(image: .liveChart, name: "실시간 차트"),
            HomeMenuModel(image: .menRecommend, name: "남성 추천"),
            HomeMenuModel(image: .womanRecommend, name: "여성 추천"),
            HomeMenuModel(image: .newRecommend, name: "색다른 추천"),
            HomeMenuModel(image: .salePrice, name: "정가 아래"),
            HomeMenuModel(image: .fortune24, name: "운세 24AW"),
            HomeMenuModel(image: .bestOftheyear, name: "올해의 베스트"),
            HomeMenuModel(image: .octoberBenefit, name: "10월 베네핏"),
            HomeMenuModel(image: .acneGift, name: "아크네 선물")
        ]
    }
}

