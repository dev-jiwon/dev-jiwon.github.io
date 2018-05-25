---
title: "스위프트 문법 8 (재귀)"
layout: post
date: 2018-05-25 15:22
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Recursion
- Factorial
- Fibonacci
- Recursive Enumerations
- Enum
- 스위프트
- 공부
- 문법
- 재귀
- 팩토리얼
- 피보나치
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# Recursion (재귀)
**자기 자신을 재참조하는 함수**

```
 어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.
 - 학생 : "재귀함수가 뭔가요?"
 - 교수 : "잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.
         마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.
         그의 답은 대부분 옳았다고 하네.
         그런데 어느날, 그 선인에게 한 선비가 찾아와서 물었어."
 
         "재귀함수가 뭔가요?"
         "잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어...
          마을 사람들은 ...."
```

재귀함수는 함수 내에서 자기 자신을 다시 호출해 다시 실행하게 한다.
```swift
count = 0

func recursiveFunction() {
  guard count != 5 else { return }
  count += 1
  print(count)
  
  recursiveFunction()   // <-------- 여기서 함수를 다시 호출하여 재귀
  print("lastline", count)
}

recursiveFunction()
```

---
## 재귀를 이용한 팩토리얼(Factorial) 구현
> Factorial Example
> index  : 1, 2, 3,  4,   5,   6,    7,       8,       9, ...
> number : 1, 2, 6, 24, 120, 720, 5040, , 40320, 362,880, ...

```swift
func factorialRecursiveFunction(N: Int) -> Int {
  guard N > 1 else { return N }
  return N * factorialRecursiveFunction(N: N - 1)
}

factorialRecursiveFunction(N: 3)
factorialRecursiveFunction(N: 5)
factorialRecursiveFunction(N: 7)
factorialRecursiveFunction(N: 9)

//---------------------------------------------------------------------
//for문을 이용한 피보나치
func factorialLoop(N: Int) -> Int {
  var sum = 1
  for idx in 1...N {
    sum *= idx
  }

  return sum
}

factorialLoop(N: 3)
factorialLoop(N: 5)
factorialLoop(N: 7)
factorialLoop(N: 9)
```

---
## 재귀를 이용한 피보나치(Fibonacci) 구현
> Fibonacci Example
> index  : 1, 2, 3, 4, 5, 6, 7,  8,  9, 10, 11, 12, ...
> number : 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

```swift
func fibonacciRecursiveFunction(N: Int) -> Int {
  guard N > 2 else { return N - 1 }
  return fibonacciRecursiveFunction(N: N - 1) + fibonacciRecursiveFunction(N: N - 2)
}


fibonacciRecursiveFunction(N: 1)
fibonacciRecursiveFunction(N: 2)
fibonacciRecursiveFunction(N: 3)
fibonacciRecursiveFunction(N: 4)
fibonacciRecursiveFunction(N: 5)

fibonacciRecursiveFunction(N: 10)
fibonacciRecursiveFunction(N: 11)
fibonacciRecursiveFunction(N: 12)

//---------------------------------------------------------
//for문을 이용한 피보나치 구현
func fibonacciLoop(N: Int) -> Int {
  guard N > 1 else { return N }
  var num1 = 0, num2 = 1
  
  for i in 1 ..< N {
    switch i % 2 {
    case 0:
      num1 = num1 + num2
    default:
      num2 = num1 + num2
    }
  }
  
  return num1 > num2 ? num1 : num2
}

fibonacciLoop(N: 2)
fibonacciLoop(N: 3)
fibonacciLoop(N: 4)
fibonacciLoop(N: 5)

fibonacciLoop(N: 10)
fibonacciLoop(N: 11)
fibonacciLoop(N: 12)
```

# Recursive Enumerations
> 자기 자신을 참조하는 Enumeration 형식

enum을 선언할때 indirect을 입력하여 자신을 참조할것이라고 표기해야합니다.

```swift
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)              
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

evaluate(sum)           //9
evaluate(product)       //18
```