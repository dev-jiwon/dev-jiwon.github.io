---
title: "스위프트 문법 17(Initializer)"
layout: post
date: 2018-06-21 13:28
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Initializer
- init
- Designated
- Convenience
- Failable
- 스위프트
- 공부
- 문법
- 초기화
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# Initializer
![Init](https://i.imgur.com/eBXPWs8.png)
- Swift 의 객체는 사용하기 전 모든 저장 프로퍼티에 대해 초기화 필수
- 다음 3 가지 중 하나를 택해 설정
  - 초기값 지정
  - 옵셔널 - nil 값으로 초기화
  - 초기값이 없고, 옵셔널 타입이 아닌 프로퍼티: `init()`을 이용
  

아래 예제를 보면 `height`, `xPosition`변수가 초기화가 되어있지않아 오류가 난다
```swift
class Rectangle {
  var value: String?
  var width: Int = 20
  var height: Int 
  var xPosition: Int
}
```

### 해결하는 방법
1. 초기값을 넣어준다.
``` swift
class Rectangle {
  var value: String?
  var width: Int = 20
  var height: Int = 0
  var xPosition: Int = 0
}
```

2. 옵셔널을 이용한다.
```swift
class Rectangle {
  var value: String?
  var width: Int = 20
  var height: Int?
  var xPosition: Int?
}
```

3. init()함수를 이용해서 초기화 한다.
```swift
class Rectangle {
  var value: String?
  var width: Int = 20
  var height: Int 
  var xPosition: Int
  init() {
    height = 10
    xPosition = 5
  }
  init(height: Int, xPosition: Int) {
    self.height = height
    self.xPosition = xPosition  
  }
}
```

## Designated Initializer
- 클래스에 반드시 1개 이상 필요
- 초기화가 필요한 모든 프로퍼티를 단독으로 초기화 가능한 Initializer
- 위에서 사용한 `init()`, `init(height: Int, xPosition: Int)` 가 여기에 해당
- 초기화 과정 중 반드시 한 번은 호출 
> 위의 3번 방법이 여기에 해당된다.

## Convenience Initializer
- 단독으로 모두 초기화할 수 없고 일부 프로퍼티만 처리한 뒤 다른 Initializer 에게 나머지 부분 위임
- 중복되는 초기화 코드 방지를 위해 사용

```swift
class Rectangle1 {
  var value: String?
  var width: Int = 20
  var height: Int
  var xPosition: Int
  
  init(height: Int, xPosition: Int) {
    self.height = height
    self.xPosition = xPosition
  }
  
  // 일부 값만을 파라미터로 받을 때
  convenience init(height: Int) {             //<----여기
    self.init(height: height, xPosition: 10)
    // 자기 자신의 초기화 메서드 호출
  }
  
//  convenience init(height: Int) {     //변수가 많을때 하나만 파라미터로 값을 받고 나머지는 설정해줄때 유용함
//    self.init()
//    self.height = height
//  }
  
  //이건 조금 아래에서 배울 Failable Initializer이다.
  init?(_ height: Int, _ xPosition: Int) {
    guard height > 0 else { return nil } //이 조건에 의해 height가 0보다 작으면 nil이 나옴
    self.height = height
    self.xPosition = xPosition
  }
}

let rect = Rectangle1(height: 20) //자동으로 convenience로 초기화됨
```

## Failable Initializer
- 객체 생성시 원하는 초기화 값이 들어오지 않거나 조건에 맞지 않을 때 객체를 생성하지 않도록 하는 것
- 옵셔널 값을 반환하게 되며 객체 생성 실패시에는 nil 을 반환

---
>  초기화 과정은 Convenience -> Convenience -> ... -> Designated (최종) 순서로 동작

---
# Super-Class Init
- 서브 클래스는 자기 자신 이외에 수퍼 클래스의 저장 프로퍼티까지 초기화 해야 함
- 수퍼 클래스의 Designated Initializer 가 기본 init 함수 하나만 있을 경우 자동으로 super.init() 이 호출됨

```swift
//부모 클래스
class Base {
  var value: String
  var someProperty: String
  
  init() {
    value = "Base"
    someProperty = "someProperty"
  }
  
  // Designated Initializer 가 하나일 때는 서브 클래스에서 수퍼클래스의 초기화 함수를 부르지 않아도 동작
  // 여러 개로 만들 경우 어떤 초기화 메서드를 선택해야 할지 알 수 없으므로 선택해주지 않으면 에러 발생
  // 이 때는, 서브 클래스의 모든 Designated Initializer 마다 수퍼 클래스의 초기화 함수를 명시적으로 선택해주어야 함.
  // Convenience 는 달라질 거 없음 -> 
  
//  init(_ value: String) {
//    self.value = value
//    self.someProperty = "someProperty"
//  }
  
  convenience init(someProperty: String) {
    self.init()
    self.someProperty = someProperty
  }
}

//자식 클래스
class Rectangle: Base {
  var width: Int = 20
  var height: Int
  var xPosition: Int
  
  override init() {
    height = 10
    xPosition = 5
  }
  
  init(height: Int, xPosition: Int) {
    self.height = height
    self.xPosition = xPosition
  }
  
  convenience init(height: Int) {
    self.init(height: height, xPosition: 10)
  }
}
```

**또 다른 예제**
```swift
class Shape {
    var name: String
    var sides : Int
    init(sides:Int, named: String) {
        self.sides = sides
        self.name = named
        printShapeDescription()
    }
    func printShapeDescription() {
        print("Shape Name :\(self.name)")
        print("Sides :\(self.sides)")
    }
}

class Triangle: Shape {
    var hypotenuse: Int
    init(hypotenuse:Int) {
        self.hypotenuse = hypotenuse
        super.init(sides: 3, named: "Triangle")
    }
    
    override func printShapeDescription() {
        super.printShapeDescription()
        print("Hypotenuse :\(self.hypotenuse)")
    }
}

let triangle = Triangle(hypotenuse: 12)

//Shape Name :Triangle
//Sides :3
//Hypotenuse :12
```

---
## Initializer 의 다른 특징들
**초기화 이전 단계에서 인스턴스 메서드 호출 불가**
> 다른 메서드 호출 중 초기화 되지 않은 프로퍼티를 사용할 수도 있기 때문에 컴파일 에러 발생

```swift
init(height: Int, xPosition: Int) {
  self.height = height
  someMethod()          // 초기화가 끝나지 않았기 때문에 Error 발생
  self.xPosition = xPosition
}

fun someMethod() {
  print(self.height)
}
```
<br />

**Extension(수평) Initializer**
> Extension에서는 Convenience Initializer 는 추가할 수 있어도 Designated Initializer 는 할 수 없음

```swift
class Rectangle {
  var height: Int
  var xPosition: Int
  
  init(height: Int, xPosition: Int) {
    self.height = height
    self.xPosition = xPosition
  }
}

//Extension으로 기능 추가
extension Rectangle {
//  // 에러 발생
//  init(height: Int, xPosition: Int) {
//    self.height = height
//    self.xPosition = xPosition
//  }
  
  // Convenience 는 가능하다.
  convenience init(height: Int) {
    self.init(height: height, xPosition: 10)
  }
}
```
<br />

**Required Initializer**
> 상속받은 클래스에서 반드시 작성해주어야 하는 초기화 메서드가 있을 때 required 키워드 사용
> 이 경우 서브 클래스에서는 해당 초기화 메서드를 반드시 작성해주어야 하며, override 키워드는 생략 가능

```swift
required init(height: Int, xPosition: Int) {
  self.height = height
  self.xPosition = xPosition
}
```

<br />

**Deinitializer**
> 할당된 객체가 해제될 때는 deinit 메소드가 호출됨.

```swift
deinit {
  // 객체 메모리 해제 시 동작할 코드
}
```