//연산자 실습

// 1. 단항 연산자: 변수 x의 값을 5로 초기화한 후 1 증가시키고, 증가된 값을 출력
var x:Int = 5
x += 1
print(x)

// 2. 이항 연산자: 변수 a와 b를 각각 10과 20으로 초기화한 뒤 더한 결과를 변수 sum에 저장하고, 그 결과를 출력
var a:Int = 10
var b:Int = 20
var sum:Int = a + b
print(sum)

// 3. 삼항 연산자: 변수 score가 60 이상이면 "합격", 그렇지 않으면 "불합격"을 출력
var score:Int = 80
var result:String = score>=60 ? "합격" : "불합격"
print(result)

// 4. 논리 연산자: 변수 isMember가 true이고 points가 100 이상이면 "할인 가능", 그렇지 않으면 "할인 불가능"을 출력
var isMember:Bool = true
var points:Int = 80
var member:String = isMember==true&&points>=100 ? "할인가능" : "할인 불가능"
print(member)

// 5. 범위 연산자: 변수 numbers에 1부터 5까지의 숫자를 저장하고, 이 숫자들을 출력
let numbers = 1...5

for number in numbers {
    if number == 5 {
        print(number)
    } else {
        print(number, terminator: ", ")
    }
}

//조건문 실습
// 1. if문: temperature가 30 이상이면 "덥다", 10 이상 30 미만이면 "적당하다", 그렇지 않으면 "춥다"를 출력
var temperature:Int = 25 //적당하다
var weather:String = temperature>=30 ? "덥다" : temperature>=10 ? "적당하다" : "춥다"
print(weather)

// 2. switch문: day에 따른 요일을 출력하고, 1~5는 "주중", 6과 7은 "주말"을 출력
var day:Int = 4 //주중
switch day {
case 1...5:
    print("주중")
case 6...7:
    print("주말")
default:
    print("잘못된 입력")
}

//반복문 실습
// 1. for-in문: 배열 fruits에 "Apple", "Banana", "Cherry"를 저장하고, 각 과일의 이름을 출력
let fruits:Array<String> = ["Apple", "Banana", "Cherry"]
for fruit in fruits {
    print(fruit)
}
// 2. while문: 변수 count가 5가 될 때까지 "Count: n" 형식으로 숫자를 출력
var count:Int = 0
while count <= 5 {
    print("Count: \(count)")
    count += 1
}
