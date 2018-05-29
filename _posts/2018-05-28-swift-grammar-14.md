---
title: "스위프트 문법 14 (옵셔널)"
layout: post
date: 2018-05-29 21:49
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- optionals
- nil
- Unwrapping
- Type Declaration
- Optional Binding
- IUO
- Implicitly Unwrapped Optionals
- Nil-coalescing Operator
- Optional Chaining
- Defining Model Classes
- 스위프트
- 공부
- 문법
- 옵셔널
- 언랩핑
- 배열 옵셔널
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# Optionals
![optional](https://i.imgur.com/bZg7o78.jpg)
<center> 값이 0인 것과 없는 것의 차이는?  (Empty vs Valueless) </center>

- Optional 은 값이 없을 수 있는(absent) 상황에 사용
- Objective-C 에는 없는 개념
- 옵셔널 타입은 2가지 가능성을 지님
  - 값을 전혀 가지고 있지 않음
  - 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음
  
```swift
let possibleNumber = "123"
var convertedNumber = Int(possibleNumber)
type(of: convertedNumber)   //Optional<Int>.Type

let possibleNumber2 = "aod" //이렇게 String 값이 숫자가 아니라 문자일때 Int로 형변환을 할 수 없기 때문에 Optional이 될 수 밖에 없다.
```

## Optional Type

### Type Declaration

```siwft
var optionalType1: String?
var optionalType2: Optional<Int>

type(of: optionalType1) //Optional<String>.Type
optionalType2           //nil (Optional을 선언 후 초기화하지않으면 nil이 됨)
```

### Valueless state - nil

```swift
var optionalInt: Int? = 0       //옵셔널 타입에 0을 넣고
optionalInt = nil               //다시 nil을 넣어 비울 수 있다.
```

### Init

```swift
var something = nil       //오류!!!!! 그냥 옵셔널은 없다.
var optionalIntInit = Optional<Int>(0)    // 이런식으로 옵셔널일지라도 타입을 지정해줘야함
type(of: optionalIntInit)       //Optional<Int>.Type
```

아래와 같은 선언 모두 오류가 난다.
```swift
var nonOptional1 = nil
var nonOptional2: Int = nil //이건 그저 Int타입에 nul을 넣으려 하기때문에 안됨
var nonOptionalType: Int = optionalInt  //위와 같은 이유로 안됨
```

아래는 문제없이 실행된다.
```swift
var integer = 1
optionalInt = integer
print(optionalInt)            //Optional(1)\n
```

> Optional -> NonOptional   (X)
> Optional <- NonOptional   (O)

<br />
Objective-C의 nil과 Swift에서의 nil은 다르다.

```
 Swift’s nil isn’t the same as nil in Objective-C.
 In Objective-C, nil is a pointer to a nonexistent object.
 In Swift, nil isn’t a pointer—it’s the absence of a value of a certain type.
 Optionals of any type can be set to nil, not just object types.
 ```
 
 ---
 
 ## If Statements and Forced Unwrapping
 

 **느낌표(!)** 를 이용해 강제로 **Optional**을 **Unwrapping**한다.
 ```swift
let possibleNumber = "123"
var convertedNumber = Int(possibleNumber) //Optional Int 

// ! = Forced Unwrapping

if convertedNumber != nil {
  print("convertedNumber has an integer value of \(convertedNumber!).")
} //여기서 convertedNumber를 느낌표로 언랩핑함
```
하지만 위에서 처럼 **Unwrapping**을 한다는건 **"여기에는 무조건 값이 있어, 절대 nil이 아니야!"** 라고 접근을 하기 때문에 **nil**일때 **Unwrapping**을하면 **오류**가 난다.

```swift
convertedNumber = nil
convertedNumber!    //오류!!!!!
```

## Optional Binding
위와 같이 강제로 Unwrapping하는것은 위험성이 있기때문에 아래와 같이 사용하는게 Unwrapping하는게 좋다.
```swift
if let ConstantName = OptionalExpression {
  Statements
}

wile let ConstantName = OptionalExpression {
  Statements
}

guart let ConstantName = OptionalExpression  else {
  Statements
}
```

if문을 이용할때는 아래와 같이 쓰인다
```swift
if let actualNumber = Int(possibleNumber) { //Int(possibleNumber) 값이 있을때 실행
  print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {    //Int(possibleNumber) 이게 nil일때 실행
  print("\"\(possibleNumber)\" could not be converted to an integer")
}
```

guard문을 사용할때는 아래와 같이 쓰인다.
```swift
func doSomething(str: String?) {
  guard let str = str else {
    //nil일때 여기가 실행됨
    return
  }
  //nil이 아닐때 실행 (값이 있을때)
  print(str)
}
```

아래와 같이 Optional Binding을 한번에 할 수 있다.
```swift
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
  print("\(firstNumber) < \(secondNumber) < 100")
}
```

간단하게 풀어 쓰면 아래와 같다.

```swift
if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < secondNumber && secondNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}
```

---
## IUO (Implicitly Unwrapped Optionals)
값 뒤에 느낌표(!) 하는게 아니라, 선언시 타입 뒤에 느낌표(!) 하는거
```swift
//옵셔널을 선언할때 물음표 사용
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!  //느낌표가 없으면 오류가 난다.
type(of: possibleString)        //Optional<String>.Type
type(of: forcedString)          //String.Type

//옵셔널을 선언할때 느낌표 사용
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString      //느낌표가 없지만 결과는 위와 같이 동일하다.
type(of: assumedString)         //Optional<String>.Type
type(of: implicitString)        //String.Type
```

> 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
> nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용

---
## Nil-coalescing Operator

```swift
optionalStr = nil

let result: String
if optionalStr != nil {
   result = optionalStr!
} else {
   result = "???"
}
//아래와 완전히 같다.
let result1 = optionalStr ?? "???"  //optionalStr이 값이 있을때는 result1에 optionalStr값을 넣고, 없을때는 result1에 "???"를 넣는다.
```

실제로 사용할때 아래와 같이 활용하면 좋다.
```swift
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName   //"red"

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName       //"green"
```

아래 두 코드는 완전히 같다.
```swift
a != nil ? a! : b
a ?? b
```

---
## Optional Chaining
자기 자신이 옵셔널이 아닐지라도 자신 상위의 값이 옵셔널일 경우 하위 값들은 옵셔널이 된다.
```swift
class Person1 {
  var residence: Residence1?
}
class Residence1 {
  var numberOfRooms = 1
  var address: String?
}

let edward = Person1()

let roomCount1 = edward.residence?.numberOfRooms      //앞에 옵셔널이 있기 때문에(residence?), 뒤(numberOfRooms)도 옵셔널이 된다.
let roomCount2 = edward.residence!.numberOfRooms      //여기서는 느낌표(!)로 옵셔널을 언래핑 했기때문에 그냥 들어온다
type(of: roomCount1)                                  //Optinal<Int>.Type
type(of: roomCount2)                                  //Int.Type

if let roomCount = edward.residence?.numberOfRooms {
  print("John's residence has \(roomCount) room(s).")
} else {
  print("Unable to retrieve the number of rooms.")
}
```

---
## Defining Model Classes for Optional Chaining
- 주소(Adress)를 나타내는 클래스를 만들 때 옵셔널을 이용한다면?
  - 빌딩 이름
  - 빌딩 번호 
  - 이렇게 무조건 필요하지 않는 것들
- 배열에 옵셔널은 어떤 식으로 사용할까

```swift
class Address {
  var buildingName: String?
  var buildingNumber: String?
  var street: String?
  //길 이름, 빌딩 번호가 있으면 빌딩 이름이 필요없고, 빌딩 이름이 있으면 길 이름 빌딩 번호가 필요없기 때문에 아래와 같이 만들면  된다.
  func buildingIdentifier() -> String? {
    if let buildingNumber = buildingNumber, let street = street {
      return "\(buildingNumber) \(street)"
    } else if buildingName != nil {
      return buildingName
    } else {
      return nil
    }
  }
}
```

<br />

### 배열 옵셔널
```swift
var arr1: [Int]? = [1,2,3]  //배열 자체 옵셔널
var arr2: [Int?] = [1,2,3, nil]  //배열 값에 대한 옵셔널(그래서 nil이 들어가도 문제 없음)

var arr3: [Int]? = nil
//var arr4: [Int?] = nil //오류 난다.

var arr0: [Int]? = [1,2,3]

if let firstRoomName = arr0?[0] {
  print("The first room name is \(firstRoomName).")
} else {
  print("Unable to retrieve the first room name.")
}

arr1?.count
arr1?[1]

arr2.count
arr2[1]
```

---
## Optional Function Types

```swift
let function: (() -> Int?)? = nil
function?()
//function!()
```