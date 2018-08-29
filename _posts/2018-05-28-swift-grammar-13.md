---
title: "스위프트 문법 13 (접근 제어)"
layout: post
date: 2018-05-29 21:40
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Access Control
- Module
- Access Levels
- private
- fileprivate
- internal
- public
- open
- Custom Types
- Getters
- Setters
- Type Aliases
- Tuple
- Enumeration
- Nested
- 스위프트
- 공부
- 문법
- 접근 제어
- 모듈
- 접근 레벨
- 개방
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# Access Control
다른 모듈의 코드 또는 다른 소스 파일 등으로부터 접근을 제한하는 것 <br />
세부 구현 내용을 숨기고 접근할 수 있는 인터페이스 지정 가능

---
**모듈(Module)**
- import 를 통해 다른 모듈로부터 불러들일 수 있는 하나의 코드 배포 단위
- Library / Framework / Application 등


**소스 파일 (Source File)**
- 모듈 내에 포함된 각각의 Swift 소스 코드 파일
<br />

<center>Swift 에서는 5가지의 다른 접근 레벨 제공</center>

![Swift Access Levels](https://i.imgur.com/ygX3YGZ.jpg)
private (가장 제한적) > fileprivate > internal (기본 레벨) > public > open (가장 개방적)

**선언하는 방법**
```swift
open class SomeOpenClass {}
public class SomePublicClass {}
internal class SomeInternalClass {}         //internal은 가장 기본이라 생략이 가능
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}
internal let someInternalConstant = 0       //변수
fileprivate func someFilePrivateFunction() {} //함수
```

---
## Custom Types
클래스 내부에서도 다양한  Acess Control을 사용할 수 있다.
```swift
public class SomePublicClass1 {                // explicitly public class
  public var somePublicProperty = 0            // explicitly public class member
  var someInternalProperty = 0                 // implicitly internal class member
  fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
  private func somePrivateMethod() {}          // explicitly private class member
}
```

<br />
클래스보다 내부에 더 자유로운 Acess를 사용하면 안됨

```swift
class SomeInternalClass1 {                     // implicitly internal class
  var someInternalProperty = 0                 // implicitly internal class member
  //public var somePublicProperty = 0     이렇게 쓰면 안됨
  fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
  private func somePrivateMethod() {}          // explicitly private class member
}
```

<br />
아래와 같이 가장 기본인 internal보다 더 제한적인 클래스 안에는 default가 internal이 아닌 클래스 자체의 Acess와 같아진다.

```swift
fileprivate class SomeFilePrivateClass1 {      // explicitly file-private class
  func someFilePrivateMethod() {}              // implicitly file-private class member
  private func somePrivateMethod() {}          // explicitly private class member
}
```
```swift
private class SomePrivateClass1 {              // explicitly private class
  func somePrivateMethod() {}                  // implicitly private class member
}
```
<br />

---
### Open / Public
아래와 같은 상황에서는 **Open**과 **Public**의 결과 값 차이는 없다. 또, 거의 모든 상황에서 아래 함수의 값을 사용할 수 있다.
> **Open**은 다른 모듈에서 **override**를 할 수 있고, **Public**은 **Override**를 할 수없다.

```swift
class SomeOpenClass {
  open var name = "name"
  open var age = 0
}

class SomePublicClass {
  public var name = "name"
  public var age = 0
}

let someOpenClass = SomeOpenClass()
someOpenClass.name
someOpenClass.age

let somePublicClass = SomePublicClass()
somePublicClass.name
somePublicClass.age
```

<br />

### Internal
**Interna**l은 가장 기본적인 Access이기 때문에 아래와같이 Access Control을 입력하지 않아도 된다.

```swift
class SomeInternalClass {
  var name = "name"
  var age = 0
}

let someInternalClass = SomeInternalClass()
someInternalClass.name
someInternalClass.age
```

<br />

### fileprivate
아래와 같이 **fileprivate**를 사용할 경우 하나의 파일내에서는 Internal과 같아 아무런 문제가 없다.
> 하지만 다른 파일에서는 사용할 수 없게 된다.

```swift
class SomeFileprivateClass {
  fileprivate var name = "name"
  fileprivate var age = 0
}

let someFileprivateClass = SomeFileprivateClass()
someFileprivateClass.name
someFileprivateClass.age
```

<br />

### private
**Private**를 사용할 경우 같은 파일에서라도 함수 내부가 아니라면 사용할 수 없다.

```swift
class SomePrivateClass {
  private var name = "name"
  private var age = 0
}

let somePrivateClass = SomePrivateClass()
somePrivateClass.name
somePrivateClass.age
```

---

## Getters and Setters
**Getter** 와 **Setter** 는 그것이 속하는 변수, 상수 등에 대해 동일한 접근 레벨을 가짐, 이 때 Getter 와 Setter 에 대해서 각각 다른 접근 제한자 설정 가능

### Setter 설정
```swift
class TrackedString {
    public(set) var numberOfEdits = 0       //set을 public으로 하겠다. 하지만 오류가 난다. 이유: class가 Internal인데 public으로 지정을 해서
     fileprivate(set) var numberOfEdits = 0      //set을 fileprivate으로 사용
  var numberOfEdits = 0         //기본 변수 선언
  var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
}

let trackedString = TrackedString()
trackedString.value = "This string will be tracked." //numberOfEdits값이 올라감
trackedString.numberOfEdits = 2 //외부에서 값을 바꿀 수는 없음
```

<br />

### Getter 와 Setter 에 대해 각각 명시적으로 표현
**Getter**와 **Setter**의 Access를 각각 다르게 설정할 수 있다.
```swift
public class TrackedString1 {
  public private(set) var numberOfEdits = 0 //get은 public, set은 private로 선언
  public var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
  public init() {}
}
```

---

##여러가지 타입에서 Access 변경
### Tuple
 Tuple 유형은 자동으로 추론되며 명시적으로 지정 불가능<br />
 튜플 유형에 대한 엑세스 수준은 해당 튜플에 사용된 모든 유형 중 가장 제한적인 엑세스 수준에 맞춰지게 됨
 
 ```swift
internal class SomeInternalClass {}
private class SomePrivateClass {}

func returnTupleFunction() -> (SomeInternalClass, SomePrivateClass) { //튜플이 가장 제한적인 엑세스인 private로 설정됨, 그래서 이 함수도 private으로 선언해야함.
  // function implementation goes here
  return (SomeInternalClass(), SomePrivateClass())
}
```

<br />

### Enumeration Types
Enum은 case에서 엑세스 수준을 선언할 수 없다. 무조건 Enum자체를 선언할때 엑세스 수준을 선언해야한다.

```swift
private enum 방위 {
  case 동, 서, 남, 북
}
```
private let enumeration = 방위.남 //위에 enum이 private이기 때문에 여기서 선언할때도 private라고 선언해줘야함

<br />

### Nested Types
선언된 함수나 클래스 내부의 데이터들은 아래와 같이 default로 되어있다.
- Private  ->  Private
- Fileprivate  ->  Fileprivate
- Internal  ->  Internal
- Public  ->  Internal
- Open  ->  Internal

<br />

### Type Aliases 

```swift
open class AliasClass {
  let someProperty = 1
}

public typealias Typealiases = AliasClass
//internal typealias Typealiases = AliasClass
//fileprivate typealias Typealiases = AliasClass

let aliasesInstance = Typealiases()
aliasesInstance.someProperty
```

