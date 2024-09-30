//
//  CountUpDownModel.swift
//  Kream
//
//  Created by 김연우 on 9/23/24.
//

import Foundation

struct CountUpDownModel {
    var count: Int = 0
    
    // count 변수를 1 증가시킵니다.
    mutating func increaseCount() {
        self.count += 1
    }
    //mutating:구조체나 열거형 내에서 인스턴스의 프로퍼티를 수정하거나 자기 자신을 변경할 수 있게 하는 기능을 제공
    
    mutating func decreaseCount() {
        self.count -= 1
    }
}
