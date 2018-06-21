---
title: "스위프트 문법 18(High-order Function)"
layout: post
date: 2018-06-21 13:28
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- High-order Function
- 스위프트
- 공부
- 문법
- 고차 함수
- 1급 객체
- First-class citizen
- forEach
- map
- filter
- reduce
- flatMap
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# High-order Function (고차함수)
고차함수란?
- 하나 이상의 함수를 인자로 취하는 함수
- 함수를 결과로 반환하는 함수
> High-order Function 이 되기 위해서는 함수가 First-class Citizen 이어야 한다.

## 1급 객체 (First-class citizen)
- 변수나 데이터에 할당할 수 있어야 한다.
- 객체의 인자로 넘길 수 있어야 한다.
- 객체의 리턴값으로 리턴할 수 있어야 한다.

```swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {   //Int를 받고 () -> Int 형태의 함수(incrementer)를 return 한다
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer // 리턴값
}

func makeIncrementer1(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    return {
        runningTotal += amount
        return runningTotal
    }
}
let incrementer = makeIncrementer(forIncrement: 7) // 변수에 할당
let incrementer2 = makeIncrementer1(forIncrement: 7)

print(incrementer())    //makeIncrementer가 함수를 리턴했기 때문에 incrementer는 함수이다.
print(incrementer())
print(incrementer2())
print(incrementer2())
//출력: 7, 14, 7, 14
```

## High-order Functions in Swift
- **forEach**
  - 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태
- **map**
  - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환
- **filter**
  - 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환
- **reduce**
  - 컬렉션의 각 요소들을 결합하여 단 하나의 타입으로 반환. ex) `Int, String`
- **flatMap**
  - 중첩된 컬렉션을 하나의 컬렉션으로 병합.
  - 요소 중 옵셔널이 있을 경우 제거 (Swift 4.1 에서 compactMap 으로 변경)
  

## Collection Type
![](https://i.imgur.com/WjUETdV.png)


### 클로져 복습
```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
names.sorted(by: { (s1: String, s2: String) in
  return s1 > s2
})

names.sorted { (s1: String, s2: String) in
  return s1 > s2
}

names.sorted { s1, s2 in return s1 > s2 }
names.sorted { s1, s2 in s1 > s2 }
names.sorted { $0 > $1 }
names.sorted(by: >)
```

아래와 같이 함수로도 가능하다

```swift
func sortFunction(s1: String, s2: String) -> Bool {
  return s1 > s2
}
names.sorted(by: sortFunction(s1:s2:))
```

### forEach
```swift
let immutableArray = [1, 2, 3, 4]

func printParam(_ num: Int) {
  print(num)
}
immutableArray.forEach(printParam(_:))

immutableArray.forEach {
  print($0)
}

[1, 2, 3, 4].forEach { num in
  print(num)
}
```

### map
[T] -> [U]
```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
names.map {
  $0 + "'s name"
}


let intArr: [Int] = Array<Int>(repeating: 2, count: 10)
intArr.enumerated().map {
  return $0 + $1
}

intArr.enumerated().map {
  return "결과는 \($0 + $1) 입니다."
}
```

### filter
[T] -> [U]
```swift
names.filter { (name) -> Bool in
  return name == "Chris"  //여기서 참일떄만 남기고 나머지 없앰
}
//["Chris"]

names.filter { (name) -> Bool in
  return name == "Tori"   //이런 이름은 없기때문에 빈 배열
}
//[]

print(names.filter { $0 == "Alex" })  //클로져로 표현
```

### reduce
[T] -> U
```swift
(1...100).reduce(0) { (sum, next) in        //sum을 0으로 시작하고 sum에 (1...100)을 하나하나 합쳐지는 값이다.(지금까지 더한 값)
  sum + next
}

(1...100).reduce(0) {$0 + $1}

//(1...100).reduce(0) { (sum, next) in
//  sum += next
//}

["1", "2", "3", "4"].reduce("") { (str, chr) in
  str + chr
}
//아래와 완전 동일
[1, 2, 3, 4].reduce("") { (str, num) in
    str + String(num)
}
```

### flatMap
```swift
//func some() -> [[Any]]{
//  return [[1, 2, 3], [1, 5, 99], [1, 1]]
//  flatMapExamaple1.flatMap { $0 }
//
//}


let flatMapExamaple1 = [[1, 2, 3], [1, 5, 99], [1, 1]]
print(flatMapExamaple1.flatMap { $0 })
//출력: [1, 2, 3, 1, 5, 99, 1, 1]
//let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil, nil]]
//print(array.flatMap { $0 }.compactMap { $0 })
//print(array.compactMap { $0 }.flatMap { $0 })
```

### compactMap
원래는 옵셔널을 제거할때 flatMap을 사용했지만 swift4.0부터 compactMap를 이용해야 한다.
```
let flatMapExamaple2: [Int?] = [1, 5, nil, 9, 16, 100, nil, 7]
print(flatMapExamaple2.flatMap { $0 })  //사용 가능하지만 warnig이 뜬다.
print(flatMapExamaple2.compactMap { $0 })
```

### 지금까지 배운걸로 아래의 문제를 풀어보자
```swift
let immutableArray = Array(1...40)
```
1. 배열의 `각 요소 * index` 값을 반환하는 함수
2. 배열 요소 중 홀수는 제외하고 짝수만 반환하는 함수
3. 배열의 모든 값을 더하여 반환하는 구현
4. immutableArray 에 대해서 1~3 번 함수를 차례대로 적용한 최종 값을 반환

내가 풀었던 답..
```swift
//배열의 각 요소 * index 값을 반환하는 함수
func first(_ array: [Int]) -> () -> [Int]{
    return {
        array.enumerated().map { $0 * $1 }
    }
}

//배열 요수 중 홀수는 제외하고 짝수만 반환하는 함수
func second(_ array: [Int]) -> () -> [Int]{
    return {
        array.filter { $0 % 2 == 0 }
    }
}

//배열의 모든 값을 더하여 반환하는 구현
func last(_ array: [Int]) -> () -> Int{
    return {
        array.reduce(0) { $0  + $1}
    }
}
//위 세개의 함수를 연결 실행 (개판임)
last(second(first(immutableArray)())())()
```
~~오... 진짜 개판이다.......~~

<br />

출제자가 의도한건 아래 답인거 같다..
```swift
immutableArray.enumerated()
.map { (offset, element) -> Int in
    return offset * element
    }.filter { (element) -> Bool in
        return element & 1 == 0
    }.reduce(0) { (sum, nextElement) -> Int in
        return sum + nextElement
}

//위를 더 줄인 결과
immutableArray.enumerated()
    .map { $0 * $1 }
    .filter { $0 & 1 == 0 } //($0 & 1 == 0) = ($0 % 2 == 0)
    .reduce(0, 1)
    
//더 줄이면
immutableArray.enumerated()
    .map( * )
    .filter({ $0 & 1 == 0 })
    .reduce(0, +)
```

### map과 compactMap의 차이
```swift
let m1 = array.map({ Int($0) })             //[nil, nil, 22, 33] 옵셔널임(nil이 있어서)
let f1 = array.compactMap({ Int($0) })         //[22, 33]  
let m2 = array.map({ Int($0) }).first       //nil
let f2 = array.compactMap({ Int($0) }).first   //22
```


