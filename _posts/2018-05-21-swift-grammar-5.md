---
title: "스위프트 문법 5 (반복문, 튜플)"
layout: post
date: 2018-05-21 17:59
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- do
- while
- loop
- for-in
- tuples
- named
- repeat
- 스위프트
- 공부
- 문법
- 반복
- 튜플

category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# Loops
반복문은 모든 프로그래밍의 기본이다. 프로그래밍을 하다보면 많은 일들을 반복해서 실행해야한다. 그럴때 반복문을 이용해서 쉽게 해결할 수 있다.

## For-In Loops
for-in문은 가장 기본적인 반복문이다. 원하는 수, 값을 순차적으로 돌아가며 반복을 할 수 있다.

```swift
//1부터 4까지 index에 넣고 아래의 코드를 반복시킨다.
for index in 1...4 { 
    print("\(index) times 5 is \(index * 5)")
}

//index값이 필요 없을때 간단하게 사용한다.
for _ in 0...3 { 
    print("hello")
}

//"Hello"라는 문자열의 문자들을 순차적으로 돌아가며 아래 코드를 반복시킨다.
for chr in "Hello" {
    print(chr, terminator: " ")//terminator: " ":문자들 사이이 크기를 엔터가 아니라 스페이스로
}

//list라는 배열 안의 값들을 순차적으로 돌아가며 아래 코드를 실행시킨다.
let list = ["Swift", "Programming", "Language"]
for str in list {
    print(str)
}

//for문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
for index in (1...10).reversed() {
    print(index)
}
//아래와 같음
for num in stride(from: 10, to: 0, by: -1){
    print(num)
}
 ```
 
 ---
## While Loops
 조건이 거짓이 될 때까지 일련의 명령문 수행<br />
 첫 번째 반복이 시작되기 전에 반복횟수가 정해져 있지 않음<br />
 
### while
 
 ```swift
 // 기본적인 while문
 var num = 0
var sum = 0
while num <= 100 { //num이 100이하일때 반복
    sum += num
    num += 1
}
```

### repeat-while
C언어의 Do-While과 같다.

```swift
num = 0
sum = 0
repeat {
    sum += num
    num += 1
} while num <= 100
```
---
# Tuples
튜플은 어떠한 값들의 묶음이다. 배열과 비슷하다고 볼 수 있는데, 배열과는 다르게 길이가 고정되어있다. 값에 접근할 때에도 `[]` 대신 `.`을 사용한다.

## Unnamed Tuple
튜플의 파라미터에 따로 이름을 짓지 않고 사용할 수 있다.
```swift
//단순하게 같은 Type의 값들을 묶어 사용할 수 있다.
let threeNumbers: (Int, Int, Int) = (1, 2, 3)
threeNumbers.0
threeNumbers.1
threeNumbers.2

//Type이 달라도 상관없다.
var threeValues: (Int, Double, String) = (1, 2.3, "456")
var threeValues2: MyData = (12, 123.2, "asd")
threeValues.2
let (_, data5, data6) = threeValues2 //첫번째 값이 필요할때 이렇게 쓸 수 있다.

//또, 아래와 같이 tuple과 typealias를 함께써서 하나의 새로운 묶음의 변수를 만들 수 있다.
typealias MyData = (Int, Double, String)
```

<br />

## Named Tuple
튜플의 파라미터에 이름을 짓지 않을 수 있지만, 이름을 짓고 사용하는게 훨씬 이해하기 쉬울것이다.

```swift
let ios = (language: "Swift", version: "4")
ios.language

typealias NamedMyData = (age: Int, weight: Double, name: String)
let jiwon: NamedMyData = (26, 60, "홍길동")
jiwon.weight
```