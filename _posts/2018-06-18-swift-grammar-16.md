---
title: "스위프트 문법 16 (Type Casting)"
layout: post
date: 2018-06-18 10:13
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Type Casting
- Upcasting
- Downcasting
- as
- any
- AnyObject
- 스위프트
- 공부
- 문법
- 캐스팅
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# Type Casting
모든 프로그래밍 언어들이 그렇듯 Swift에는 다양한 종류의 Type가 존재하고, 질서 유지를 위해 다른 종류의 Type들을 섞어서 사용할 수 없다. 
그렇기 때문에 서로 다른 Type을 섞어 사용하기위해서는 **Type Casting**이 필요하다.

## Type Check
아래와 같은 여러가지 변수의 타입을 알아내는 방법을 설명하도록 하겠다.
```swift
class className {}
var anyArray: [Any] = [1, "2", 3.0]
var anyObjectArray: [AnyObject] = [className()]
```

### 타입 확인 - type(of: )
type(of: )라는 함수를 이용하면 간단하게 확인할 수 있다.
```swift
func printGenericInfo<T>(_ value: T) {    //여기서 파라미터 T는 타입을 알려주는 타입이다.
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(2)   //'2' of type 'Int'

type(of: anyArray)        //type(of: anyArray)
type(of: anyObjectArray)  //type(of: anyObjectArray)
type(of: 1)               //type(of: 1)
```

### 타입 비교 - is
두가지의 타입을 비교할때는 is를 이용해 간단하게 비교할 수 있다.
```swift
var anyArray: [Any] = [1, "2", 3.0]
if anyArray[0] is Int {
  print("Int")        //Int
} else {
  print("else")
}

type(of: anyArray[0])   //Int.Type
```

위에서 배운 타입 확인에 사용한 `type(of: )`를 사용하기 위해서는 `.Type`까지 명시해줘야 한다.
```swift
if type(of:anyArray[0]) is Int.Type {
  print("Equal")
}

if type(of:anyArray[0]) is Int {  //에러 발생
  print("Equal")
}

```

또, 아래와 같이 witch문을 이용해서 찾을 수 있다.
```swift
var anyArray: [Any] = [1, "2", 3.0]
for i in 0...anyArray.count-1 {
    switch anyArray[i] {
    case is Int:
        print("Int")
    case is String:
        print("String")
    case is Double:
        print("Double")
    default:
        print("?")
    }
}

/* 출력 값
Int
String
Double
*/
```

### 상속 관계
상속 관계일때 is를 이용해 부모 클래스인지, 자식 클래스인지 알 수 있다.
```swift
class Human {}
class Student: Human {}
class Baby: Human {}

let someone: Student = Student()
print(someone is Human)     //true
print(someone is Student)   //true
print(someone is Baby)      //false
```
위 예제에서 someone은 Student이기때문에 Human을 상속받았지만, Baby를 상속받지는 않았다. 그렇기 때문에 `is Human`, `is Student`에는 true를 return하지만 `is Baby`는 false를 return한다.

---
## Type Casting
1. **as**  : 타입 변환이 **확실하게 가능한 경우**(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
2. **as?** : **강제 타입 변환** 시도. 변환이 **성공하면 Optional 값**을 가지며, **실패 시에는 nil 반환**
3. **as!** : **강제 타입 변환** 시도. **성공 시 언래핑 된 값**을 가지며, **실패 시 런타임 에러** 발생

Type Casting에 사용될 클래스들 선언
```swift
import UIKit

class Shape {
    var color = UIColor.white
    
    func draw() {
        print("draw shape")
    }
}

class Rectangle: Shape {
    var cornerRadius = 0.0
    
    override func draw() {
        print("draw rect")
    }
}

class Triangle: Shape {
    override func draw() {
        print("draw triangle")
    }
}

class Circle: Shape {
    var radius = 50.0
    
    override func draw() {
        print("draw circle")
    }
}

let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()
let circle = Circle()
```

## Upcasting
자기보다 부모 클래스를 사용해서 업캐스팅하여 선언
~~사실상 거의 사용되지 않는다.~~
```swift
let rect = Rectangle()      //일반적인 Rectangle
rect.color          //사용 가능 
rect.cornerRadius   //사용 가능

let upcastedRect: Shape = Rectangle()   //Shape를 사용한 Rectangle
upcastedRect.color  //사용 가능
//upcastedRect.cornerRadius   //사용 불가
```

## Downcasting
아래와 같이 사용하면 오류남. 이유는 Rectangle은 Shape의 자식 클래스이기 때문에
```swift
let downcastedRect: Rectangle = upcastedRect 
```

다운사이징 후 사용하기 위해서는 아래와 같이  as를 이용해 형변환을 해줘야한다.
```swift
let upcastedRect: Shape = Rectangle()

let downcastedRect: Rectangle = upcastedRect as! Rectangle
downcastedRect.color
downcastedRect.cornerRadius
```

아래와 같이 as?를 이용해서도 가능하다
```swift
if let downcastedRect = upcastedRect as? Rectangle {
    print(downcastedRect)
}
```

## Type Check Operator
```swift
let list = [shape, rectangle, triangle, circle]     //타입은 [shape]이다.

for elem in list {
    if elem is Shape {         // always true
        print("shape instance")
    } else if elem is Rectangle {
        print("rect instance")
    } else if elem is Triangle {
        print("triangle instance")
    } else if elem is Circle {
        print("circle instance")
    }
}
```

---
## 업, 다운 캐스팅 정리
### 업 캐스팅
 - 상속 관계에서 수퍼 클래스로의 변환 및 자기 자신의 타입으로 변환하는 것은 반드시 수행 가능
 - 이것을 업캐스팅이라 하며 as 키워드 사용 가능
 e.g.
```swift
 let someone: Student = Student()
 let human: Human = someone as Human
 ```
 
### 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 as? 또는 as! 를 사용
 e.g.
```swift
 let someone = Student()
 let student1 = someone as? Student   // Optional(Student)
 let student2 = someone as! Student   // Student
 let baby1 = someone as? Baby         // nil
 let baby2 = someone as! Baby         // Runtime Error
```

---
# Any , AnyObject
일반적(Int, String등)인 변수 선언에서 타입을 지정하게 되는데 그 외의 다른 타입은 넣을 수 없다. 하지만 Any를 이용한다면 모든 타입을 넣을 수 있다. <br />
Any(모든 타입), AnyObject(모든 레퍼런스 타입: class)
Any > AnyObject

```swift
class SomeClass1 {}
class SomeClass2 {}

var anyArray: [Any] //Any타입을 사용할때는 항상 명시해줘야한다.
var anyObjectArray: [AnyObject]

anyArray = [0, "str", true, 9.9, SomeClass1()]  //모든 일반적인 타입을 다 넣음
//아래에는 일반적인 타입을 넣으면 오류가 난다. 오직 레퍼런스 타입만을 넣을 수 있다.
anyObjectArray = [SomeClass1(), SomeClass2(), SomeClass1(), SomeClass2()] 

anyArray.append("newElement") //추가도 가능하다.
```

하지만 값을 가져와 추가를 하려면 아래와 같이 형변환을 해줘야 한다.
```swift
var num2: Int = (anyArray[0] as? Int)!
var num3: Int! = anyArray[0] as? Int
var num4: Int = anyArray[0] as! Int
```
```swift
type(of: anyArray[0])   // Int.Type
type(of: anyArray[1])   // String.Type
anyArray[0]             //0
anyArray[1]             //"str"

print(anyArray[1])      //str
print(type(of: anyArray[1]))  //String
```