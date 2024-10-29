// 1. "최종 결제 금액: (최종 결제 금액)원"과 같이 출력되도록 작성해주세요!
func calculateTotalPrice(amount: Int, tip: Int) -> Int {
    let calculate = amount + tip
    return calculate
}
print("최종 결제 금액: \(calculateTotalPrice(amount: 1000, tip: 100))원")

// 2. "덥다", "춥다", "적당하다"와 같이 출력되도록 작성해주세요!
func checkTemperature(temperature: Int) -> String {
    if temperature > 30 {
        return "덥다"
    } else if temperature < 10 {
        return "춥다"
    } else {
        return "적당하다"
    }
}
print(checkTemperature(temperature: 20))

// 3. "(여행지)에서의 총 여행 예산은 (총 예산)원입니다."와 같이 출력되도록 작성해주세요!
func printTravelBudget(destination: String, budget: Int) -> String {
    return "\(destination)에서의 총 여행 예산은 \(budget)원입니다."
}
print(printTravelBudget(destination: "서울", budget: 1000000))

import Foundation
// 4. "오늘 날짜: 2024-09-19"와 같이 오늘 날짜가 "YYYY-MM-DD" 형식으로 출력되도록 작성해주세요!
func getCurrentDate() -> String {
    let date = Date()  // 현재 날짜와 시간
    let formatter = DateFormatter()  // 날짜 형식을 지정하는 포맷터
    formatter.dateFormat = "yyyy-MM-dd"  // 출력할 형식 설정
    return formatter.string(from: date)  // 형식에 맞는 문자열 반환
}

// 함수 호출 및 출력
print("오늘 날짜: \(getCurrentDate())")
