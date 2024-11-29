//
//  SizeCell.swift
//  Kream

struct SizeDatas{
    let size: String
    let price: String = "360,000원"
}

extension SizeDatas {
    static func dummy() -> [SizeDatas] {
        return [
            SizeDatas(size: "S"),
            SizeDatas(size: "M"),
            SizeDatas(size: "L"),
            SizeDatas(size: "XL"),
            SizeDatas(size: "XXL")
        ]
    }
}

