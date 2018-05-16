---
title: "스위프트 문법 - (1)"
layout: post
date: 2018-05-16 15:54
image: https://i.imgur.com/ph8w3kP.png
headerImage: false
tag:
- swift
- start
- 스위프트
- 공부
- 기초
category: Swift
author: JIWON
description: 스위프트의 기본 문법들
---
## 필기의 습관!! 주석 달기
프로그래밍의 규모가 커지면 내가 짠 코드를 내가 알아볼 수 없는 현상을 쉽게 볼 수  있습니다.
그렇기에 주석은 프로그래밍에 없어서는 안될 중요한 요소이며, 필요한 가장 큰 이유는 아래와 같습니다.
 1. 빠르게 특정 부분의 코드를 비활성화
 2. 협업 또는 인계 시 이해를 돕기 위해
 3. 자기 자신을 위해
 4. 문서화
 
**아래는 주석을 다는 방법입니다**
 - //  : 한 줄 주석
 - /// : 한 줄 주석 + Quick Help Markup
 - /* */ : 멀티 라인 주석  (Nested 가능)
 
주석 없이도 쉽게 이해할 수 있을 만한 코드를 짜는 것이 베스트이지만 현실적으로 어려움이 많기때문에 주석을 습관화하는 것이 좋습니다.

---
## 프로그래밍의 시작 “Hello, World!”
스위프트에서 출력하기위해서 `print`를 사용합니다.
```swift
print("Hello, World!") //Hello, World
```
`print`를 이용해 문자열 뿐만 아니라 변수에 저장된 모든 타입의 값을 출력할 수 있습니다.
```swift
var num = 1
print(num) //1
//-------------------------
print("숫자", num)
print("숫자 \(num)") //가장 많이 쓰임
print("숫자 " + String(num))
//위 3개의 출력 결과: 숫자1
```

---
## Semicolon (;)
대부분의 프로그래밍 언어는 모든 명령이 끝나면 세미클론(;)을 입력해 명령을 마쳤어야 했습니다. 하지만 스위프트에서 세미클론의 입력 여부는 자유이며, 세미클론을 입력해주지 않더라도 문제 될게 없습니다. <br />
하지만, 한 문장에 여려 명령(다중 명령)을 실행 할 경우 세미클론으로 명령어를 구분해줘야 합니다.
```swift
print(1); print(2); print(3);
```

---
## Constants and Variables
상수와 변수는 현재 어떤 데이터에 대한 상태값, 속성 정보 등을 담고 있는 컨테이너입니다.
- **상수 (Constants)** : 한 번 설정되면 값 변경 불가
  let을 이용해 선언을 해줍니다.
- **변수 (Variables)** : 설정한 값을 변경 가능
  var을 이용해 선언을 해줍니다.
  
```swift
let maximumNumberOfLoginAttempts = 10
// maximumNumberOfLoginAttempts = 20 (이렇게 상수를 변경하려고 할 시 오류가 뜹니다) 
var currentLoginAttempt = 0
currentLoginAttempt = 1 //변수 변경 가능

//아래와 같이 여러개의 변수, 상수를 한번에 선언해 줄 수 있다.
var x = 0.0, y = 0.0, z = 0.0 
```

---
## Naming
 스위프트는 영어 외에도 유니코드 문자를 포함한 **대부분**의 문자를 사용해 네이밍 가능합니다. 

```swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let 한글 = "세종대왕"
let `let` = 1   // Swift 에서 사용되는 키워드일 경우 backquote(`) 를 이용해 사용 가능

print(π)
print(你好)
print(한글)
print(🐶🐮)
print(`let`)
```
그렇다고 모든 이름으로 변수를 선언할 수 있는 것은 아닙니다. 사용할 수 없는 규칙은 아래와 같습니다.
 1. 같은 스코프 범위 내에서 중복되는 이름
 2. 공백문자
 3. 수학 기호 (√, ∑ 등)
 4. 화살표 (→, ← 등)
 5. 숫자로 시작하는 이름 (시작 부분 외에는 사용 가능)

> 변수를 선언할때 딱 봐도 이해할 수 있는 이름을 짓는것이 중요합니다.

---
## Type Annotation & Type Inference
### Type Annotation (타입 지정)
**-> 변수 선언 시 사용될 자료의 타입을 명확하게 지정하는 것**
```swift
let year: Int = 10 //이렇게 타입(Int)을 지정하여 선언

let language: String //타입을 지정해줄 경우 값을 초기화하지 않아도 된다.
language = "Swift 4"

var red, green, blue: Double //여러개의 지정된 타입(Double)의 변수를 한번에 선언
red = 255.0
green = 150.123
blue = 75
```
### Type Inference (타입 추론)
**-> 변수 선언 시 초기화로 사용되는 값의 타입을 통해 변수의 타입을 추론하여 적용하는 것**
```swift
var weight = 6.4 //이렇게 타입을 지정하지 않고 선언

var spelling = ["T", "O", "R", "I"]
```

---
## Literals & Types
- 상수 - 고정된 값 (메모리 주소) 을 가지는 심볼/식별자
- 리터럴
    - 소스코드에서 고정된 값으로 표현되는 문자 (데이터) 그 자체
    - 정수 / 실수 / 문자 / 문자열 / 불리언 리터럴 등

### Numeric Literals
아래와 같이 일반적으로 간단하게 숫자를 표현할 수 있다.
```swift
var singedInteger = 123
singedInteger = +123
```

아래와 같이 2진법, 8진법, 16진법 등을 사용할 수 도 있다.
```swift
let binaryInteger = 0b10001 //2진법 (0b)
let octalInteger = 0o21 //8진법 (0o)
let hexadecimalInteger = 0x11 //16진법 (0x)
```

큰 수를 입력할때 가독성을 올리기 위해 아래와 같이 사용할 수 도 있다.
```swift
var bigNumber = 1_000_000_000
bigNumber = 1_0000_0000 //원하는 자리수별로 끊을 수 있음
bigNumber = 0x1000_1000_0000 //2진법에서도 사용 가능
```

### Integer Types
Integer은 정수를 표현하는 타입이며, 기본적으로 **Int*를 이용해 선언한다. 
Int의 종류는 아래와 같다.
- 8-bit : Int8, UInt8
- 16-bit : Int16, UInt16
- 32-bit : Int32, UInt32
- 64-bit : Int64, UInt64
- Platform dependent : Int, UInt (64-bit on modern devices)
```swift
var unsignedInteger: UInt = 123 //이렇게 UInt를 사용할 수 있다.
type(of: unsignedInteger)
```
> 현재 대부분의 컴퓨터는 64bit컴퓨터이기때문에 대부분 Int64가 default로 지정되어있고, 특수한 상황이 아닌 한 UInt보다 Int를 쓰는게 권장되고 있다.

### Floating-point Literal
소수를 표현하는 방법은 **Double**과 **Float**이 있다. 
- Double - 최소 소수점 이하 15 자리수 이하의 정밀도
- Float - 최소 소수점 이하 6 자리수 이하의 정밀도
- 부동 소수점이므로 소수점 이하의 정밀도는 변경 될 수 있음

소숫점을 표현하는 방법은 아래와 같이 3가지가 있다.
```swift
var floatingPoint = 1.23
floatingPoint = 1.23e4
floatingPoint = 0xFp3
```

### Boolean Literal
Boolean은 참(true), 거짓(false)로 이루어져 이며, 선언 방법은 아래와 같이 **Bool**을 이용하면 된다.
```swift
var isBool = true
var isBoolean :Bool = false
```

### String Literal
String은 문자열을 표현하는 타입이며, 선언 방법은 아래와 같이 **String**을 이용하면 된다.
```swift
let str = "Hello, world!"
var language: String = "Swift"
```

### Character Literal
Character은 문자를 표현하는 타입이며, 선언 방법은 아래와 같이 **Character**을 이용하면 된다.
```swift
var character: Character = "C"
```
캐릭터를 선언할때는 무조건 위와 같이 타입을 지정해줘야 한다.
지정하지 않으면 Character타입이 아닌 String타입으로 선언된다.

---
## Typealias
Typealias는 문맥상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶을 경우 사용한다.
```swift
typealias AudioSample = UInt16 //UInt16이라는 타입 이름 대신 AudioSample라는 이름으로 타입을 선언할 수 있다.

var maxAmplitudeFound = AudioSample.min
var maxAmplitudeFound1 = UInt16.min
```
> Typealias를 잘 사용하면 편하게 프로그래밍을 할 수 있다.

---
## Type Conversion (타입 변환)
프로그래밍을 하다보면 원하는 값의 다른 타입의 값을 갖고 싶을 때가 있다. 이럴 때 타입 변환을 사용하면 된다.
사용 방법: 원하는 값이나 변수를 괄호로 묶고 앞에 원하는 타입을 적으면 된다.
```swift
let h = UInt8(25) //이런식으로 타입을 변환할 수 있다.
let x = 10 * h
print(x)

let num = 10
let floatNum = Float(num)//이렇게 변수를 형변환 할 수 도 있다.
```










