import Foundation

actor OrderProcessor {
    private var orders: [String] = []
    
    // 주문 추가 메서드
    func addOrder(_ order: String) async {
        orders.append(order)
        print("추가된 주문: \(order)")
    }
    
    // 주문 처리 메서드
    func processOrder() async {
        if orders.isEmpty {
            print("처리할 주문 없음")
        } else {
            let order = orders.removeFirst()
            print("처리된 주문: \(order)")
        }
    }
    
    // 현재 남아있는 주문 출력 메서드
    func printAllOrders() async {
        if orders.isEmpty {
            print("남아 있는 주문 없음")
        } else {
            print("남아 있는 주문: \(orders.joined(separator: ", "))")
        }
    }
}

let orderProcessor = OrderProcessor()

Task {
    // 주문 추가
    await orderProcessor.addOrder("Pizza")
    await orderProcessor.addOrder("Burger")
    await orderProcessor.addOrder("Pasta")
    
    // 첫 번째 주문 처리
    await orderProcessor.processOrder()
    await orderProcessor.processOrder()
    
    // 남아 있는 주문 확인
    await orderProcessor.printAllOrders()
    
    // 마지막 주문 처리
    await orderProcessor.processOrder()
    
    // 마지막 남아 있는 주문 확인
    await orderProcessor.printAllOrders()
}
