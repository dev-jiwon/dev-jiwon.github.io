---
title: "스위프트 문법 7 (Enumerations)"
layout: post
date: 2018-05-23 16:54
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Enumerations
- enum
- Matching Enumeration Values
- Associated Values
- Raw Value
- Implicitly Assigned Raw Values
- Initializing from a Raw Value
- 스위프트
- 공부
- 문법
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# Enumerations
연관된 값의 그룹에 대해 공통 타입을 정의한 뒤 type-safe 하게 해당 값들을 사용 가능

> Enumeration **Type 이름**은 **Pascal Case**, 각 **case** 는 **Camel Case**

```swift
enum SomeEnumeration{ //대문자로 이름을 만듦 (파스칼 케이스)
    case north
    case south
    case east
    case west
}

let directionToHead = SomeEnumeration.south
```

이미 위에서 선언과 동시에 SomeEnumeration enum으로 type이 지정되었기 때문에 아래와 같이 그냥 .north라고 입력해도 된다. 

```swift
directionToHead1 = .north 
```

### Matching Enumeration Values
swich문을 이용한 응용

```swift
switch directionToHead {
case .north:
    print("north")
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print("west")
}
```

### Associated Values

```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 82351, 35123, 3)

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
```

### Raw Value
- Strings, Characters, or any of the Integer or Floating-point number types
- raw value 는 해당 Enumeration 내에서 반드시 고유한 값이어야 함.

```swift
enum ASCIIControlCharacter1: Character {  //이렇게 case의 값을 주면 rawValue를 이용해 사용할 수 있다.
  case tab = "\t"
  case lineFeed = "\n"
  case carriageReturn = "\r"
}

ASCIIControlCharacter2.tab                                                      //tab
ASCIIControlCharacter2.tab.rawValue //그 안에서 지정된 값을 사용하려면 이렇게 하면됨        //"    "
```

아래 두 예제는 일주일이라는 같은 주제를 enum으로 표현했지만 위 예제는 rawValue는 Int, 아래 예제는 String으로 되어있다.

```swift
enum Weekday: Int {
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}
Weekday.wednesday           //wednesday
Weekday.wednesday.rawValue  //3

enum WeekdayName: String {
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}
WeekdayName.monday          //monday 
WeekdayName.monday.rawValue //"monday"
```

### Implicitly Assigned Raw Values

```swift
enum WeekDay4: Int{ //Int를 이용할 경우 이렇게 지정한 값 뒤의 case들은 그 수를 이어서 출력하게 된다
    case sunday, monday = 100, tuesday, wednesday, thursday, friday, Saturday
}
WeekDay4.sunday.rawValue        //0
WeekDay4.wednesday.rawValue     //102  따로 지정하지 않앗지만 앞에서 값을 지정했기 때문에 102가됨


enum WeekdayNameAgain: String {
  case sunday, monday = "mon", tuesday = "tue", wednesday, thursday, friday, saturday
}
WeekdayNameAgain.wednesday
WeekdayNameAgain.wednesday.rawValue
```

### Initializing from a Raw Value

```swift
enum PlanetIntRaw: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

PlanetIntRaw(rawValue: 2) //이렇게 반대로 값을 넣고 이름을 찾을 수 도 있다.

enum PlanetIntRaw2: String {
    case mercury, venus = "good", earth, mars, jupiter, saturn, uranus, neptune
}
PlanetIntRaw2(rawValue: "good")

let positionToFind = 1

if let somePlanet = PlanetIntRaw(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
```