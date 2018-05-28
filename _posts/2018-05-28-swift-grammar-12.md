---
title: "스위프트 문법 12 (Set)"
layout: post
date: 2018-05-28 14:03
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Collection Functions
- value
- Array
- set
- Subset
- Supreset
- isSubset
- isStrictSubset
- isSuperset
- isStrictSuperset
- Fundamental
- intersection
- isDisjoint
- union
- subtracting
- symmetricDifference
- 스위프트
- 공부
- 문법
- 셋
- 집합
- 교집합
- 합집합
category: blog
author: JIWON
description: 스위프트의 기본 문법들
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

![subset](https://i.imgur.com/TiShyCS.png)

a, b, c는 각각 Set이며 a는 b의 superset, b는 a의 subset, b와 c는 서로에게 disjoint한 관계이다.

“is equal” operator (==) : 두 Set의 내용이 전부 동일 (Item의 type, count, value 모두)

- **isSubset(of:)**: subset인지를 판
- **isSuperset(of:)**: superset인지를 판별
- **isStrictSubset(of:)**: subset이면서, subset!=superset
- **isStrictSuperset(of:)**: superset이면서, subset!=superset
- **isDisjoint(with:)**: 두 Set 간의 교집합이 없음


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
- **intersection**
- **union**
- **subtracting**
- **symmetricDifference**

<br />

![Fundamental Set Operations](https://i.imgur.com/ayg1wJm.png)

#### intersection (교집합)
```swift
//{"Kiwi"}
favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

if favoriteFruits.isDisjoint(with: tropicalFruits) {
  print("favoriteFruits ∩ tropicalFruits = ∅")
} else {
  print("favoriteFruits ∩ tropicalFruits")    //favoriteFruits ∩ tropicalFruits
}

let commonSet = favoriteFruits.intersection(tropicalFruits) 
commonSet                                                   
  
tropicalFruits.formIntersection(favoriteFruits)             
tropicalFruits                                              
```

#### union (합집합)
```swift
//{"Melon", "Kiwi", "Orange", "Apple"}
var unionSet = favoriteFruits.union(tropicalFruits)
unionSet  

unionSet = Set(favoriteFruits)  
unionSet.formUnion(tropicalFruits)  
unionSet  
```

#### subtracting (빼기)
```swift
//{"Melon", "Orange", "Apple"}
let uncommonSet = favoriteFruits.subtracting(tropicalFruits)
uncommonSet

favoriteFruits.subtract(tropicalFruits)
favoriteFruits
```

#### symmetricDifference
```swift
//{"Melon", "Kiwi", "Orange", "Apple"}
let exclusiveSet = favoriteFruits.symmetricDifference(tropicalFruits)
exclusiveSet


favoriteFruits.formSymmetricDifference(tropicalFruits)
favoriteFruits
```



