//
//  SavedModel.swift
//  Kream
//
//  Created by 김연우 on 10/9/24.
//

import Foundation

// model - struct : 값 타입. 구조체의 인스턴스를 복사할 때 마다 별도의 복사본 생성. 복사된 인스턴스는 원본과 독립적
struct GoodsModel {
    let goodsImg: String
    let goodsName: String
}

// TODO: - 상품이름 및 설명, 가격, 북마크 아이콘 구현 필요
final class dummySavedModel {
    static let savedDatas: [GoodsModel] = [
        GoodsModel(goodsImg: "saved1.png", goodsName: "상품 1"),
        GoodsModel(goodsImg: "saved2.png", goodsName: "상품 2"),
        GoodsModel(goodsImg: "saved3.png", goodsName: "상품 3"),
        GoodsModel(goodsImg: "saved4.png", goodsName: "상품 4"),
        GoodsModel(goodsImg: "saved5.png", goodsName: "상품 5"),
        GoodsModel(goodsImg: "saved6.png", goodsName: "상품 6"),
        GoodsModel(goodsImg: "saved7.png", goodsName: "상품 7"),
        GoodsModel(goodsImg: "saved8.png", goodsName: "상품 8")
    ]
}

//// model - class : 참조 타입. 클래스의 인스턴스를 복사해도 동일한 인스턴스 참조
//// 글로벌한 상태를 유지해야하는 데이터를 참조 타입으로 관리함으로써 데이터 일관성과 효율적 메모리 관리 가능.
//class GoodsCountModel {
//    private let goodsDefaults = UserDefaults.standard
//    private let goodsTextKey: String = "goodsCount"
//    /// 사용자가 저장한 goods의 개수를 goodsDefaults에 저장
//        /// - Parameter text: cell에 저장된 goods의 개수
//    public func saveGoodsCount(_ count: Int) {
//            goodsDefaults.set(count, forKey: goodsTextKey)
//        }
//        
//        /// goodsCount에 저장된 값을 불러옴
//        /// - Returns: 저장된 값 Int로 return
//        public func loadGoodsCount() -> Int? {
//            return goodsDefaults.integer(forKey: goodsTextKey)
//        }
//}
