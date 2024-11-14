class BankAccount {
    // Properties
    let accountNumber: String            // 계좌 번호 (변경 불가)
    private(set) var balance: Double     // 잔액 (외부에서 수정 불가)
    
    // Initializer
    init(accountNumber: String, initialBalance: Double) {
        self.accountNumber = accountNumber
        self.balance = max(0, initialBalance)  // 초기 잔액이 음수일 경우 0으로 설정
    }
    
    // Deposit method
    func deposit(amount: Double) {
        guard amount > 0 else {
            print("Deposit amount must be positive.")
            return
        }
        balance += amount
        print("Deposited: \(amount). Current balance: \(balance)")
    }
    
    // Withdraw method
    func withdraw(amount: Double) {
        guard amount > 0 else {
            print("Withdrawal amount must be positive.")
            return
        }
        
        if amount > balance {
            print("Insufficient funds")
        } else {
            balance -= amount
            print("Withdrew: \(amount). Current balance: \(balance)")
        }
    }
}

//출력

/* 코드 시나리오, 위 클래스 구현 후 실행 시켜주세요! */

let account = BankAccount(accountNumber: "123-456", initialBalance: 100.0)

account.deposit(amount: 50.0) // 출력: "Deposited 50.0. Current balance: 150.0"
account.withdraw(amount: 30.0) // 출력: "Withdrew 30.0. Current balance: 120.0"
account.withdraw(amount: 200.0) // 출력: "Insufficient funds. Current balance: 120.0"
