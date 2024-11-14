struct Car {
    // Properties
    let make: String             // 차량 제조사
    let model: String            // 차량 모델명
    let year: Int                // 차량 연식
    private(set) var mileage: Double // 주행거리 (외부에서 직접 수정 불가)
    private(set) var isRunning: Bool // 차량 상태 (작동 중 여부)
    
    // Initializer
    init(make: String, model: String, year: Int, mileage: Double, isRunning: Bool = false) {
        self.make = make
        self.model = model
        self.year = year
        self.mileage = mileage
        self.isRunning = isRunning
    }
    
    // Start method
    mutating func start() {
        if isRunning {
            print("차 이미 시동 중.")
        } else {
            isRunning = true
            print("차 시동 걸림.")
        }
    }
    
    // Stop method
    mutating func stop() {
        if !isRunning {
            print("차 이미 꺼짐.")
        } else {
            isRunning = false
            print("차 시동 꺼짐.")
        }
    }
    
    // Drive method
    mutating func drive(distance: Double) {
        guard distance > 0 else {
            print("주행거리는 0보다 커야 합니다.")
            return
        }
        
        if isRunning {
            mileage += distance
            print("이동거리 \(distance) km. 현재 mileage: \(mileage) km")
        } else {
            print("이동 불가능. 차 시동 꺼짐.")
        }
    }
}


/* 코드 시나리오, 위 클래스 구현 후 실행 시켜주세요! */

var myCar = Car(make: "한국", model: "KIA", year: 2024, mileage: 15000.0, isRunning: false)

myCar.start() // 출력: "차 시동 걸림."
myCar.drive(distance: 100) // 출력: "이동거리 100 km. 현재 mileage: 15100 km"
myCar.stop() // 출력: "차 시동 꺼짐."
myCar.drive(distance: 50) // 출력: "이동 불가능. 차 시동 꺼짐."
myCar.start() // 출력: "Car started."
myCar.start() // 출력: "차 이미 시동 중."
