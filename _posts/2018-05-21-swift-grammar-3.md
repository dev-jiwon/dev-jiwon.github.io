---
title: "스위프트 문법 3 (조건문)"
layout: post
date: 2018-05-21 14:00
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Conditional
- Statements
- if Statements
- else
- switch
- case
- default
- fallthrough
- guard
- 스위프트
- 공부
- 문법
- 조건
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

# Conditional Statements (조건문)
조건문은 모든 프로그래밍의 기본이다. 프로그래머가 명시한 불린 자료형 조건이 참인지 거짓인지에 따라 달라지는 계산이나 상황을 수행하는 프로그래밍 언어의 특징이다.
Swift에서 조건문은 **if**, **guard**, **switch**를 사용한다.
## if Statements
if문은 프로그래머가 if, else 이 두 함수를 조합하여 명시한 조건이 **true**일때만 실행하게 하는문법이다.<br />
- if: 조건이 참일때만 실행
- else: 앞에 나온 if 조건의 범위를 제외한 값들만 실행

```swift
// if

var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}


// if - else

temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}


// if - else if - else

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
} else {
  print("It's not that cold. Wear a t-shirt.")
}

// if - else if

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
  print("It's really warm. Don't forget to wear sunscreen.")
}
 ```

 ---
## Guard
guard문은 if문과 비슷한 용도로 쓰인다. 쓰는 주요 이유는 정리에 용의하다는 점이다.

```swift
func update(age: Int) {
    if 0...100 ~= age { //0부터 100사이에 age가 포함되어 있다면
        print("OK")
    }
}

update(age: 10)
```

---

## switch Statements
**switch**문은 **switch**, **case**, **default**함수를 이용해 어떠한 하나의 값과 여러가지의 case들을 비교하요 맞는 case를 실행하는 문법이다.<br />
> switch 문은 가능한 모든 사례를 반드시 다루어야 함

```swift
//---switch statements---
let alphabet: Character = "a"
// 가장 기본적으로 하나의 값과 하나의 값을 비교
switch alphabet {
case "a":
  print("The first letter of the alphabet")
case "z":
  print("The last letter of the alphabet")
default:
  // Invalid, the case has an empty body
  break
//  print("Some other character")
}

//---Interval Matching---
let approximateCount = 30
// 하나의 값과 일정 범위를 비교
switch approximateCount {
case 0...50:
  print("0 ~ 50")
case 51...100:
  print("51 ~ 100")
default:
  print("Something else")
}

//---Compound Cases---
//하나의 값이 범위 내에 있는지 비교
switch someCharacter {
case "a", "e", "i", "o", "u":
  print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
  print("\(someCharacter) is a consonant")
default:
  print("\(someCharacter) is not a vowel or a consonant")
}
```

### value binding
두개의 값 중 하나의 값만 비교를 하고싶을때 아래와 같이 사용 가능

```swift
let stillAnotherPoint = (9, 0)

switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
  print("On an axis, \(distance) from the origin")
default:
  print("Not on an axis")
}
```

### fallthrough
다른 언어의 switch문에서 break를 안쓴것처럼 이어서 다음 case문을 진행함

```swift
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also"
  fallthrough                               //여기서 끝나지 않고 이어서 다음 조건문으로 넘어감
default:
  description += " an integer."
}
print(description)
```
