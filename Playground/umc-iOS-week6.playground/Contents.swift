class Rectangle {
    // 저장 프로퍼티 선언
    var width: Double
    var height: Double
    
    // 타입 프로퍼티 선언
    static let unit: String = "cm"
    
    // 초기화 메서드
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    // 연산 프로퍼티로 면적 계산
    var area: Double {
        return width * height
    }
}

// 1. "사각형의 너비: \(rectangle.width) cm, 높이: \(rectangle.height) cm"와 같이 출력되도록 작성해주세요!
let rectangle = Rectangle(width: 10.0, height: 5.0)
print("사각형의 너비: \(rectangle.width) \(Rectangle.unit), 높이: \(rectangle.height) \(Rectangle.unit)")

// 2. "사각형의 면적: \(rectangle.area) cm²"와 같이 출력되도록 작성해주세요!
print("사각형의 면적: \(rectangle.area) \(Rectangle.unit)²")

// 3. "사각형의 면적: \(rectangle.area) \(Rectangle.unit)²" 형식으로 출력되도록 작성해주세요!
print("사각형의 면적: \(rectangle.area) \(Rectangle.unit)²")
