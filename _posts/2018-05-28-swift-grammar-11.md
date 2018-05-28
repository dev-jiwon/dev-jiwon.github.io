---
title: "스위프트 문법 11 (Dictionary)"
layout: post
date: 2018-05-28 14:00
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Collection Functions
- value
- key
- Dictionary
- 스위프트
- 공부
- 문법
- 사전
- 딕셔너리
category: blog
author: JIWON
description: 스위프트의 기본 문법들
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


