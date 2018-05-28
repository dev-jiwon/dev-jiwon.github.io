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
- 사전형
- 키
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---
# Collection
**Collection**은 배열, 사전형과 같이 어느 값들을 모아놓은 형태이다.
<br />
![Collection](https://i.imgur.com/v05m1Ge.png)
**Value Type (Swift Collection)**
- Array
- Dictionary
- Set

**Object Type (Foundation Collection)**
- NSArray, NSMutableArray
- NSDictionary, NSMutableDictionary
- NSSet, NSMutableSet

**Copy-on-Write Optimization**

**Generic Collection**

**Mutability**
- let => Immutable Collection
- var => Mutable Collection

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

**배열 내의 Value수를 count하기 위해서는 .count를 이용하면 된다.**
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
Array에 찾는 값이 있는지 찾을때 .contains을, 원하는 값이 어디있는지 찾을때는 .index(of: )를 사용하면 된다
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
새로운 값을 **원하는 index위치에 추가**하고 싶을때는** .insert(값, at: index위치)**를 이용하면 된다.
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
배열에 원하는 index를 지우고 싶다면 .remove(at: index번호)를 이용하면 된다. 또, 배열 내 모든 값을 지우고 싶을때는 .removeAll()을 이용하면 지울 수 있다.
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
처음 배열에 대한 글을 썻던것 처럼 배열은 순서가 있는 Collection Functions이다. 그렇기때문에 순서는 중요한데. 이러한 배열의 순서를 정렬하려면 .sort(), .sorted()를 이용하면 된다.
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

---

## Dictionary
순서 없이 배열과 키로 조합되어있는 형태의 Collection Functions.
- Element = Unique Key + Value
- Unordered Collection

### Dictionary Literal
```swift
//var dictFromLiteral = ["key 1": "value 1", "key 2": "value 2"]
var dictFromLiteral = ["1": 1, "2": 2]

//아래와 같이 값을 다 지울 수 있다.
//var dictFromLiteral = [:]
dictFromLiteral = [:]
```

<br />

### Dictionary Type
타입을 지정하고 선언하려면 아래와 같이 하면 된다.
```swift
let words1: Dictionary<String, String> = ["A": "Apple", "B": "Banana", "C": "City"]
let words2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]
let words3 = ["A": "Apple", "B": "Banana", "C": "City"]
```

<br />


### Number of Elements
값의 개수를 알아내기 위해서는 배열과 동일하게 .count를 사용하면 된다
```swift
var words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count

if !words.isEmpty {
  print("\(countOfWords) element(s)")       //3 element(s)
} else {
  print("empty dictionary")
}
```

<br />


### Retrieve an Element
키값을 이용해 값을 찾기 위해서는 아래와 같이 하면 된다.
```swift
var words = ["A": "Apple", "B": "Banana", "C": "City"]
if let aValue = words["A"] {
  print(aValue)                 //Apple
} else {
  print("Not found")
}

if let zValue = words["Z"] {
  print(zValue)
} else {
  print("Not found")            //Not found
}

print(words.keys)               //["C", "B", "A"]
print(words.values)             //["City", "Banana", "Apple"]

let keys = Array(words.keys)      //["C", "B", "A"]
let values = Array(words.values)  //["City", "Banana", "Apple"]
```

<br />


### Searching
```swift
//var words = ["A": "Apple", "B": "Banana", "C": "City"]

if words.contains(where: { (key, value) -> Bool in
  return key == "A"
  }){
  print("contains A key.")
}

if words.contains(where: { (dict) -> Bool in
  return dict.value.lowercased() == "City".lowercased()
}) {
  print("contains City value.")
}

if words.contains(where: { $0.1.lowercased() == "City".lowercased() }) {
  print("contains City value.")
}

let filteringResult = words.filter { (key, value) -> Bool in
  return value.lowercased().contains("a")
}


for (key, value) in filteringResult {
  print("\(key) - \(value)")
}
```

<br />


### Add a New Element
사전형에 새로운 값을 넣을때는 아래와 같이 원하는 키값과, value값을 입력하면된다.
단, 키값이 중복된다면 원래 있던 value값이 사라지고 새로운 value값으로 대체된다.
```swift
words = ["A": "Aids"]    //초기화
words["A"]    // "Aids"

//"A"라는 키값의 value가 Aids였지만 아래와같이 변경할 수 있다.
words["A"] = "Apple"
words                   //["A": "Apple"]

//원래 없던 키값을 입력하면 새로 추가할 수 있다.
words["B"] = "Banana"
words                   //["B": "Banana", "A": "Apple"]
```

<br />


### Change an Existing Element
위의 방식으로 값을 변경하는데에는 위험사항이 많다. 원하지 않는 상황이 일어날 수 있기때문에 아래와 같은 방법으로 사용하는편이 좋다.
```swift
words = [:]
words["A"] = "Apple111"
words                     //["A": "Apple111"]

if let oldValue = words.updateValue("Apple", forKey: "A") {
  print("\(oldValue) => \(words["A"]!)")        //"Apple111 => Apple\n"
} else {
  print("+ \(words["A"]!)")
}

words       //["A": "Apple"]
```

<br />

### Remove an Element

```swift
words = ["A": "Apple", "B": "Banana", "C": "City", "Z": "Zoo"]
words["Z"] = nil
words             //["B": "Banana", "A": "Apple", "C": "City"]

//없는 키값의 value를 nil로 하면 당연히 아무런 변화가 없다
words["EE"] = nil
words             ////["B": "Banana", "A": "Apple", "C": "City"]
```

하지만 위와 같은 방법은 위험하기 때문에 아래와 같이 사용하는 편이 좋다.
```swift
if let removedValue = words.removeValue(forKey: "C") {
  print("\(removedValue) removed!")     //City removed!
}

words         //["B": "Banana", "A": "Apple"]

words.removeAll()     //모든 값을 지울 때 사용
```

<br />

### Enumerating an Dictionary
```swift
let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict {
  print("\(key): \(value)")
}
```
> 출력 값
> C: City
> B: Banana
> A: Apple

키값이나, value값 중 하나만 출력하고 싶을 때 언더바(_)를 이용하면 된다.
```swift
for (key, _) in dict {
  print(key)
}
```
> 출력 값
> C
> B
> A

```swift
for (_, value) in dict {
  print(value)
}
```
> 출력 값
> City
> Banana
> Apple

<br />

---

## Set
- Unordered Collection  (정렬되지 않음)
- Unique Value  (고유의 값)
- Set Literal = Array Literal

선언은 아래와 같이 한다.
```swift
let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
let numbers: Set = [1, 2, 3, 3, 3]
let emptySet = Set<String>()
```

<br />

### Number of Elements
value 개수를 파악하는 함수는 다른 Collection Function 처럼 `.count`를 사용하면 된다.
```swift
fruitsSet.count                             //3

if !fruitsSet.isEmpty {
  print("\(fruitsSet.count) element(s)")    //3 element(s)
} else {
  print("empty set")
}
```

<br />

### Searching
검색 기능역시 다른 배열들과 크게 다르지 않다.
```swift
if fruitsSet.contains("Apple") {
  print("yes")                      //yes
}

let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]
let filteredSet = productSet.filter { (element) -> Bool in
  return element.hasPrefix("i")
}

filteredSet   //{"iPad", "iPad Pro", "iPhone"}
```

<br />

### Add a New Element
새로운 값을 넣고 싶을때는 `.insert`를 이용하면 된다.
```swift
var set: Set<String> = []
set.insert("Apple")
set                     //{"Apple"}

var result = set.insert("Orange")
result
set                     //{"Orange", "Apple"}

result = set.insert("Orange")
result
set                     //{"Orange", "Apple"}
```

<br />

### Remove an Element
값을 삭제하려면 `.remove`, 또, 모든 값을 삭제하려면 `.removeAll`을 사용하면 된다.
```swift
set = ["Apple", "Orange", "Melon"]

if let removed = set.remove("Apple") {
  print("\(removed) has been removed!")     //Apple has been removed!
}

set                                         //{"Orange", "Melon"}

set.removeAll(keepingCapacity: true)        //Set([])
```

<br />

### Compare two sets
두개의 set을 비교하려면 
```swift
var favoriteFruits = Set(["Apple", "Orange", "Melon"])
var tropicalFruits = Set(["Orange", "Melon", "Apple"])

//순서와 상관없이 같은 값을 갖고있기 때문에 참이된다.
if favoriteFruits == tropicalFruits {
  print("favoriteFruits == tropicalFruits")     //favoriteFruits == tropicalFruits
} else {
  print("favoriteFruits != tropicalFruits")
}

//순서가 달라 거짓이 된다.
if favoriteFruits.elementsEqual(tropicalFruits) {
  print("favoriteFruits == tropicalFruits")
} else {
  print("favoriteFruits != tropicalFruits")     //favoriteFruits != tropicalFruits
}
```

<br />

### Subset & Supreset
다른 Collection에는 없는 set에만 있는 집합 관련 특징이다. 
<br />

![subset](https://i.imgur.com/YLyM2MB.png)
a, b, c는 각각 Set이며 a는 b의 superset, b는 a의 subset, b와 c는 서로에게 disjoint한 관계이다.

“is equal” operator (==) : 두 Set의 내용이 전부 동일 (Item의 type, count, value 모두)

- isSubset(of:) : subset인지를 판
- isSuperset(of:) : superset인지를 판별
- isStrictSubset(of:) : subset이면서, subset!=superset
- isStrictSuperset(of:) : superset이면서, subset!=superset
- isDisjoint(with:) : 두 Set 간의 교집합이 없음


```swift
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])
let yellowFruits = Set(["Banana"])

//yellowFruits는 yellowFruits의 부분 집합인가?
if yellowFruits.isSubset(of: tropicalFruits) {
  print("yellowFruits ⊂ tropicalFruits")    //yellowFruits ⊂ tropicalFruits
} else {
  print("yellowFruits ⊄ tropicalFruits")
}

// subset이면서, subset!=superset
if yellowFruits.isStrictSubset(of: tropicalFruits) {
  print("yellowFruits ⊂ tropicalFruits")
} else {
  print("yellowFruits ⊄ tropicalFruits")
}

//superset인지를 판별
if tropicalFruits.isSuperset(of: yellowFruits) {
  print("tropicalFruits ⊃ yellowFruits")
} else {
  print("tropicalFruits ⊅ yellowFruits")
}

//superset이면서, subset!=superset
if tropicalFruits.isStrictSuperset(of: yellowFruits) {
  print("tropicalFruits ⊃ yellowFruits")
} else {
  print("tropicalFruits ⊅ yellowFruits")
}
```

<br />

### Fundamental Set Operations
여기하면됨

---
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