---
title: "스위프트 문법 10 (Array)"
layout: post
date: 2018-05-28 13:55
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Collection Functions
- value
- Array
- 스위프트
- 공부
- 문법
- 배열
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

## Array (배열)
- 배열은 순서가 있다
- Ordered Collection
- Zero-based Integer Index

배열도 다른 일반적인 변수들과 같이 var로 선언하면 수정할 수 있고, let으로 선언하면 수정할 수 없다.
```swift
var variableArray = [1, 2]
variableArray = []

let constantArray = [1, 2]
constantArray = []        //오류!!!!!
```

<br />

**배열에는 선언한 모든 타입을 담을 수 있다.**
```swift
var Array1 = [1, 2]           //Int형 배열
var Array2 = ["1", "2"]       //String형 배열
var Array3 = [1.2, 2.1]       //Double형 배열

//정해진 타입이 아니라 모든 타입을 넣을 수 있는 Any형 배열이 있는데 나중에 다루겠다.
```

<br />

**배열을 선언하는 방법은 아래와 같다.**
```swift
let strArray1: Array<String> = ["apple", "orange", "melon"]
let strArray2: [String] = ["apple", "orange", "melon"]
let strArray3 = ["apple", "orange", "melon"]

//(repeating: "iOS", count: 5)를 이용해 ios라는 String값을 5개 저장 한다.
let strArray4 = Array<String>(repeating: "iOS", count: 5)
```

<br />

**비어있는 배열을 선언하려면 반드시 타입을 지정해줘야 한다.**
```swift
let emptyArray: [String] = []
```

<br />

**배열 내의 Value수를 count하기 위해서는 `.count`를 이용하면 된다.**
```swift
let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count
```

<br />

### Retrieve an Element
- [Int]
- [Array.Index]
- [a...b]
- [a..<b]

```swift
            0        1         2
fruits = ["Apple", "Orange", "Banana"]

fruits[0]       //Apple
fruits[2]       //Banana
fruits[0...2]   //["Apple", "Orange", "Banana"]
fruits[0..<3]   //["Apple", "Orange", "Banana"]
//fruits[123]   //123 index가 없기때문에 오류가 난다.

fruits.startIndex //0
fruits.endIndex   //3

fruits[fruits.startIndex]   //Apple
fruits[fruits.endIndex - 1] //Banana


fruits.startIndex == 0     //true
fruits.endIndex - 1 == 2   //true
```

<br />

### Searching
Array에 찾는 값이 있는지 찾을때 `.contains`을, 원하는 값이 어디있는지 찾을때는 `.index(of: )`를 사용하면 된다
```swift
let alphabet = ["A", "B", "C", "D", "E"]

//.contains를 이용해 "A"가 있는지 확인
if alphabet.contains("A") {
  print("contains A")
}

if alphabet.contains(where: { str -> Bool in
  // code...
  return str == "A"
}) {
  print("contains A")
}

//.index(of: )를 이용해 "D"의 인덱스 값을 찾았다. 
if let index = alphabet.index(of: "D") {
  print("index of D: \(index)")
}
```

<br />

### Add a new Element
배열에 **새로운 값을 추가**하고 싶을때는 **.append** 혹은 **더하기(+)**를 이용하면 된다.
새로운 값을 **원하는 index위치에 추가**하고 싶을때는 `.insert(값, at: index위치)`를 이용하면 된다.
```swift
var alphabetArray = ["A"]

alphabetArray.append("B")
//alphabetArray.append(1) //당연히 맞지 않는 타입을 넣으면 오류가 난다.
alphabetArray += ["C"]

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2  //이렇게 두개의 배열을 합칠 수 있다.

alphabetArray.insert("S", at: 0)
alphabetArray.insert("F", at: 3)
```

<br />

### Change an Existing Element
배열의 값을 변경하고 싶다면 변경을 희망하는 값의 인덱스를 입력하고 일반 변수의 값을 변경하듯 `=`로 변경하면 된다.
```swift
alphabetArray = ["A", "B", "C"]
//값이 "A"였던 인덱스 0의 값을 "Z'로 변경
alphabetArray[0] = "Z"          //["Z", "B", "C"]

//아래와 같이 하면 원래 값들은 다 사라지고 덮어 씌울 수 있다.
alphabetArray = ["A", "B", "C"]

alphabetArray[alphabetArray.startIndex ..< alphabetArray.endIndex.advanced(by: -1)] = ["X", "Y"]

alphabetArray     //["X", "Y", "C"]

alphabetArray = ["A", "B", "C", "D", "E", "F"]
alphabetArray[2...] = ["Q", "W", "E", "R"]
alphabetArray
```

<br />

### Remove an Element
배열에 원하는 index를 지우고 싶다면 `.remove(at: index번호)`를 이용하면 된다. 또, 배열 내 모든 값을 지우고 싶을때는 `.removeAll()`을 이용하면 지울 수 있다.
```swift
alphabetArray = ["A", "B", "C", "D", "E"]
//0번째 값을 지우고 지워진 값을 removed에 저장
let removed = alphabetArray.remove(at: 0)

removed             //"A"
alphabetArray       //["B", "C", "D", "E"]

alphabetArray.removeAll()
alphabetArray.removeAll(keepingCapacity: true)


// 응용, index 찾아 지우기

alphabetArray = ["A", "B", "C", "D", "E"]

let indexC = alphabetArray.index(of: "C")
alphabetArray.remove(at: indexC!)
alphabetArray
```

<br />

### Sorting
처음 배열에 대한 글을 썻던것 처럼 배열은 순서가 있는 Collection Functions이다. 그렇기때문에 순서는 중요한데. 이러한 배열의 순서를 정렬하려면 `.sort()`, `.sorted()`를 이용하면 된다.
<br />
sort와 sorted의 차이
- **sort()**
  - sort()함수를 실행하는 배열을 정렬 하고 저장한다.
  - public mutating func sort()
- **sorted()**
  - sorted()함수를 실행하는 배열을 정렬한 값을 return한다.
  - sorted()를 실행한 배열 변수에는 변경된 값이 저장되지 않는다.
  - 다른 변수에 정렬된 값을 저장해야 한다.
  - public func sorted() -> [Element]

```swift
alphabetArray = ["A", "B", "C", "D", "E"]

//아래와 같이 배열 내 값들을 섞었다. 
for i in 0 ..< (alphabetArray.count - 1) {
  let j = Int(arc4random_uniform(UInt32(alphabetArray.count)))
  alphabetArray.swapAt(i, j)
}
alphabetArray //["D", "A", "E", "C", "B"]

var sortedArray = alphabetArray.sorted()
sortedArray           //["A", "B", "C", "D", "E"]
alphabetArray         //["D", "A", "E", "C", "B"]

alphabetArray.sort()  //["A", "B", "C", "D", "E"]
alphabetArray         //["A", "B", "C", "D", "E"]


// sort by closure syntax
// 아래와 같이 클로져를 이용해 원하는 규칙으로 정렬할 수도 있다.

sortedArray = alphabetArray.sorted { $0 > $1 }  
alphabetArray.sorted(by: >= )                   //["E", "D", "C", "B", "A"]
alphabetArray.sorted(by: <= )                   //["A", "B", "C", "D", "E"]
sortedArray                                     //["E", "D", "C", "B", "A"]


alphabetArray.sort { $0 > $1 }
alphabetArray                                   //["E", "D", "C", "B", "A"]
```

<br />

### Enumerating an Array

```swift
let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.index(of: value) {
    print("\(index) - \(value)")
  }
}

//출력 값
//0 - Apple
//1 - Orange
//2 - Melon


//반대로 열거
for value in array.reversed() {
  if let index = array.index(of: value) {
    print("\(index) - \(value)")
  }
}
//출력 값
//2 - Melon
//1 - Orange
//0 - Apple


for tuple in array.enumerated() {
  print("#\(tuple.0) - \(tuple.1)")
//  print("#\(tuple.offset) - \(tuple.element)")
}


for (index, word) in array.enumerated() {
  print("#\(index) - \(word)")
}

//출력 값
//#0 - Apple
//#1 - Orange
//#2 - Melon
```