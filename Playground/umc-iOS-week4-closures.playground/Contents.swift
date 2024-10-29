// 1. Int 변수를 파라미터로 받는 addValue 클로저를 선언하고 출력해주세요! 값은 임의로 넣어주세요.
let addValue = { (value: Int) in
    return value }
print("결과: \(addValue(10))")

// 2. 1번에서 선언한 addValue 클로저를 $를 이용해 경량화 시킨 코드를 아래 넣어주세요!
let addValue2: (Int) -> Int = { $0 }

print("결과: \(addValue2(10))")
