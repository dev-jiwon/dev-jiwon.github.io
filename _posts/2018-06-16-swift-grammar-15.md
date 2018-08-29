---
title: "스위프트 문법 15 (Closure)"
layout: post
date: 2018-06-16 22:12
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- closure
- Inline
- Trailing
- Syntax
- 스위프트
- 공부
- 문법
- 클로저
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# Closure 

> function - named code block <br />
> closure - unnamed code block (lambdas, 익명 함수)

## Basic Closure

```swift
let simpleClosure = {
    print("This is SimpleClosure!!")
}
simpleClosure()
//This is SimpleClosure!!
```
위의 Closure는 () -> () 타입이다.
<br />
파라미터를 넣을 수 도 있다.
```swift
let closureParameter = { (str: String) -> Int in        //in은 그냥 구분하는 역할
    return str.count
}

closureParameter("Swift") //클로져에서는 파라미터 이름을 입력하지 않아도 된다.
```
위의 Closure은 (String) -> Int타입이다.

또, 함수를 일반 변수에 넣어서 저장할 경우에도 Closure가 된다.
```swift
func voidFunction() {
    print("1")
}

let var1 = voidFunction
```

또, 직접적으로 파라미터와 리턴을 명시해줄 수 있다.
```swift
let var2: ()->() = {
    print("1")
}
//아래와 완전 동일
let var3 = { ()->() in
    print("1")
}
```

---
## Inline closure

```swift
func printSwift() {
    print("Swift")
}
let arg = {
    print("Inline Closure!!")
}

func closureParamFunction(closure: () -> Void) {    //파라미터이름을 closure라고 지정
    closure()
}

closureParamFunction(closure: arg)
closureParamFunction(closure: printSwift)
closureParamFunction(closure: {
    print("explicit closure parameter name")
})
```

---
## Trailing Closure
클로져의 마지막 인자는 인자 이름을 입력하지 않아도 사용할 수 있다.
```swift
closureParamFunction() {
  print("Trailing")
}

closureParamFunction {
  print("Trailing")
}

func closureParamFunction2(closure1: () -> Void, closure2: () -> Void) {
  closure1()
  closure2()
}

closureParamFunction2(closure1: {
  print("inline")
}, closure2: {
  print("inline")
})

closureParamFunction2(closure1: {
  print("inline")
}) {  //여기에 인자명도 사용하지 않고 사용할 수 있다.
  print("trailing")
}
```

---
## Syntax Optimization

```swift
//어떻게 실행되는지 모름
func performClosure(param: (String) -> Int) {
    print(param("Swift"))
}

//어떤 값이 들어오는지 모름
performClosure(param: { (str: String) -> Int in
    return str.count
})
```
위의 코드를 아래와 같이 줄여나갈 수 있다.
```swift
performClosure(param: { (str: String) in
  return str.count
})

performClosure(param: { str in
  return str.count
})

performClosure(param: {
  return $0.count
})

performClosure(param: {
  $0.count
})

performClosure(param: ) {
  $0.count
}

performClosure() {
  $0.count
}

performClosure { $0.count }
```

