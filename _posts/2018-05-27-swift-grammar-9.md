---
title: "스위프트 문법 9 (Collection Functions)"
layout: post
date: 2018-05-27 23:38
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Collection Functions
- key
- value
- Array
- Dictionary
- Set
- 스위프트
- 공부
- 문법
- 배열 섞기
- 배열
- 컬랙션
- 함수
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---
# Collection
**Collection**은 배열, 사전형과 같이 어느 값들을 모아놓은 형태이다.
<br />
![Collection](https://i.imgur.com/v05m1Ge.png)
**Value Type (Swift Collection)**
- [Array](/swift-grammar-10)
- [Dictionary](/swift-grammar-11)
- [Set](/swift-grammar-12)

**Object Type (Foundation Collection)**
- NSArray, NSMutableArray
- NSDictionary, NSMutableDictionary
- NSSet, NSMutableSet

**Copy-on-Write Optimization**

**Generic Collection**

**Mutability**
- let => Immutable Collection
- var => Mutable Collection


## stride
**stride: 성큼 성큼 걷다**

### stride(from:to:by)
```swift
func stride<T>(from: T, to: T, by: T.Stride)
```

 - from 값으로 시작하여 stride 값만큼 증가하면서 to 값을 포함하지 않는 (숫자 부호에 따라 작거나 큰) 숫자까지 반복
 
e.g.  ```swift[start, start + stride, start + stride * 2, ..., until less than end]```


아래와같이 사용 가능 
```swift
let strideThrough = stride(from: 0, to: 6, by: 3)
var iterator = strideThrough.makeIterator() //makeIterator: 반복 형태로 만듦
while let element = iterator.next() { //위에 makeIterator로 했기때문에 .next()이렇게 넘길 수 있다.
  print(element)    //0, 3
}
```

더욱 직관적인 예제
```swift
for i in stride(from: 0, to: 10, by: 2) {
  print(i, terminator: " ")
}
```

그냥 Int값이 아니라 수학적으로 파이를 이용해서 사용할 수도 있다.
```swift
for radians in stride(from: 0.0, to: .pi * 2, by: .pi / 2) {
  let degrees = Int(radians * 180 / .pi) //
  print("Degrees: \(degrees), radians: \(radians)")
}
//Degrees: 0, radians: 0.0
//Degrees: 90, radians: 1.57...
//Degrees: 180, radians: 3.14...
//Degrees: 270, radians: 4.71...
```

숫자의 변화를 플러스(+) 뿐만 아니라 마이너스(-)도 가능
```swift
for countdown in stride(from: 3, to: 0, by: -1) {
  print(countdown, "...", separator: "")
}
//3...
//2... 
//1...
```

시작하는 값에서 숫자의 변화를 준 값이 마지막 값 사이에 없다면 오류가 나지 않고 종료된다.
```swift
for i in stride(from: 0, to: 5, by: -1) {
  print(i)      
}
//출력 없음
```

### stride(from:through:by)
```swift
 func stride<T>(from: T, through: T, by: T.Stride)
 ```
 - from 값으로 시작하여 stride 값만큼 증가하면서 through 값을 **포함**한 숫자까지 반복
 
 e.g.  ```swift
[start, start + stride, start + stride * 2, ..., until less than or equal to end] ```

```swift
print("- example1 -")
for i in stride(from: 0, through: 6, by: 3) {
  print(i)
}
//0 3 6

print("\n- example2 -")
for countdown in stride(from: 3, through: 0, by: -1) {
  print(countdown, "...", separator: "")
}
//3... 2... 1... 0...
```

---
## repeatElement
 ```swift
 func repeatElement<T>(_ element: T, count n: Int) -> Repeated<T>
 ```
 - 동일 요소를 count 값만큼 가진 컬렉션 생성
 
 ```swift
let zeroes = repeatElement(0, count: 5)
for x in zeroes {
  print(x)
}
// 0 0 0 0 0

for x in repeatElement(true, count: 3) {
  print(x)
}
//true true true 
```

---
## zip
```swift
 func zip<Sequence1, Sequence2>(
   _ sequence1: Sequence1,
   _ sequence2: Sequence2
 ) -> Zip2Sequence<Sequence1, Sequence2> where Sequence1 : Sequence, Sequence2 : Sequence
 ```
 - 두 개의 시퀀스를 통해 새로운 한 쌍의 시퀀스를 생성
 
 ```swift
let words = ["일", "이", "삼", "사"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
    print("\(word): \(number)")
}
```
두개의 배열이 서로 크기다 다를때 크기가 작은거에 자동으로 맞춰짐
```swift
let words = ["일", "이", "삼", "사"]
let naturalNumbers = 1...Int.max
let zipped = Array(zip(words, naturalNumbers))      //Arraay를 이용해 zip을 배열로 형변환
print(zipped)
//[("일", 1), ("이", 2), ("삼", 3), ("사", 4)]
```

Optioanl에서도 사용 가능
```swift
let names = ["James", "Edward", "John", "Jessie", "Julia"]
let scores = [100, nil, 90, nil, 70, nil]
for (name, score) in zip(names, scores) {
    print(name, " : ", score)
}
//forEach 사용해보기
zip(names, scores).forEach { name, score in
    print(name, " : ", score)
}
```

그 외의 사용 예제
```swift
let filenames = ["image", "text", "video"]
let extensions = ["png", "txt", "mpeg", "pdf", "jpeg", "html"]

zip(filenames, extensions).forEach { name, extensions in
    print(name + "." + extensions)
}
```

---
## sequence
 ```swift
 func sequence<T>(first: T, next: (T) -> T?)
 ```
 - first 값으로 시작하여 next 값을 lazy 하게 반복하는 순열 생성
 
 ```swift
 var multiplyBy2 = sequence(first: 1) { $0 * 2 }
sequence(first: 1) { num in
    return num * 2
}

print(multiplyBy2.next()) //Optional(1)
print(multiplyBy2.next()) //Optional(2)
print(multiplyBy2.next()) //Optional(4)
```
prefic라는 함수를 이용해 원하는 만큼 실행할 수있다.
```swift
for i in multiplyBy2.prefix(5) {
    print(i)
}
```
forEach를 이용하기 (위와 완전 동일)
```swift
multiplyBy2.prefix(7).forEach { print($0)}
```
반복해서 같은 숫자 출력하기
```swift
let repeatSeq = sequence(first: 5) { $0 }
for x in repeatSeq.prefix(5) {
    print(x)
}
```
---
## etc (enumerated, sorted, reversed)
### enumerated 
아주 자주 쓰이는 함수이다.
```swift
for (idx, num) in [5,1,2,4,3].enumerated() {
  print(idx, num)
}
//0 5
//1 1
//2 2
//3 4
//4 3
```

### sorted
배열을 정렬한다. 
```swift
for (idx, num) in [5,1,2,4,3].sorted().enumerated() {
  print(idx, num)
}
//0 1
//1 2
//2 3
//3 4
//4 5
```

### reversed
배열을 거꾸로 뒤집는다.
```swift
for (idx, num) in [5,1,2,4,3].sorted().reversed().enumerated() {
    print(idx, num)
}
//0 5
//1 4
//2 3
//3 2
//4 1
```