---
title: "스위프트 문법 3 (함수)"
layout: post
date: 2018-05-20 22:27
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- function
- Parameter
- Argument
- 스위프트
- 공부
- 문법
- 함수
- 파라미터
- 아규먼트
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---
# Function
  - **함수**
    - 일련의 작업을 수행하는 코드 묶음을 식별할 수 있는 특정한 이름을 부여하여 사용하는 것
  - **유형**
    - Input과 Output이 모두 있는 것 (Function)
    - Input이 없고 Output만 있는 것 (Generator)
    - Input이 있고 Output은 없는 것 (Consumer)
    - Input과 Output이 모두 없는 것
  - **구조**
    - ```swift
    func functionName(parameterList: Type) -> ReturnType{
      //code
    }
    ```
    
    - **Parameter**
      - 매개변수 = 인자 = Parameter
      - 인수를 담는 변수의 한 종류로서 해당 함수 내부 스코프에만 영향
      - 대부분 call by value 가 기본
      - call by reference 는 호출할 때 사용한 전달인자에까지 영향

    - **Argument**
      - 전달인자 = 인수 = 실인수 = Argument
      - 함수 호출 시 그에 필요한 데이터를 전달
      
스위프트에는 다양한 종류의 함수가 있다. 아래에서 예제와 함께 설명하도록 하겠다.
<br />

---
파라미터 내부 이름과, 외부 이름을 똑같이 사용할때는 아래와 같이 파라미터에 이름하나와 타입을 입력하면 된다.
```swift
//내부, 외부 모두 person이라는 이름으로 파라미터 사용
func greetAgain(person: String) -> String { 
    return "Hello again, " + person + "!"
}

greetAgain(person: "Anna")
```

<br />
외부에서 파라미터를 선언할때 파라미터의 이름을 따로 입력하지 않게 만들고 싶다면 아래와 같이 외부 파라미터 이름을 언더바(_)로 입력해준다.
```swift
func greetAgain(_ person: String) -> String { 
    return "Hello again, " + person + "!"
}

greetAgain("Anna") //따로 파라미터 이름을 적지 않고 값을 넣을 수 있다.
```

<br />
파라미터 내부 이름과, 외부 이름을 다르게 사용할때는 아래와 같이 파라미터에 외부 이름, 내부 이름 순으로 쓰고 타입을 입력하면된다.
```swift
//외부이름: argumentLabel, 내부이름: parameterName
func someFunction(argumentLabel parameterName: Int) { 
    print(parameterName) //내부에서 쓰는 이름으로 사용
}

someFunction(argumentLabel: 10) //외부에서 쓰는 이름 argumentLabel
```

<br />
사용자가 따로 파라미터값을 입력하지 않을때 초기화 값이 있는경우 파라미터에 원하는 값을 넣어주면 된다..
```swift
//두번째 파라미터(parameterWithDefault의 default값을 12로 지정)
func functionWithDefault(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) -> Int {
    return parameterWithDefault
}

functionWithDefault(parameterWithoutDefault: 3, parameterWithDefault: 6) 
functionWithDefault(parameterWithoutDefault: 4)
```

<br />
파라미터의 수를 모를때 One-Sided Ranges를 이용한다.
```swift
//Variadic Parameters 파라미터 수를 모를때 사용
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,3,4,5,6)
```

<br />
위 예시처럼 파라미터의 수를 모른체 파라미터를 받고, 마지막으로 또 다른 파라미터를 받고싶으면 아래와 같이 한다.
```swift
func arithmeticMean1(_ numbers: Double...,and and2:Double) -> Double{  //and, and2처럼 둘다 이름을 짓어야함
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / and2
}

arithmeticMean1(1,3,4,5,6, and: 10)
```

<br />
파라미터가 없지만 리턴이 있는 함수
```swift
func sayHelloWorld() -> String {
    return "hello, world"
}

print(sayHelloWorld())
```

<br />
파라미터는 있지만 리턴이 없는 함수
```swift
func printSomeThing(someThing: String) {
    print(someThing)
}

printSomeThing(someThing: "Hello")
```

<br />
**Nested Functions (중첩 함수)**
<br />
외부에는 숨기고 함수 내부에서만 사용할 함수를 중첩하여 사용 가능
```swift
func chooseStepFunction(backward: Bool, value: Int) -> Int {
  func stepForward(input: Int) -> Int {
    return input + 1
  }
  func stepBackward(input: Int) -> Int {
    return input - 1
  }
  
  if backward {
    return stepBackward(input: value)
  } else {
    return stepForward(input: value)
  }
}


var value = 4
chooseStepFunction(backward: true, value: value)
chooseStepFunction(backward: false, value: value)
```

<br />