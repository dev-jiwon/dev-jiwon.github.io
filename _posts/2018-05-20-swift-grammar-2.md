---
title: "스위프트 문법 2 (작성중)"
layout: post
date: 2018-05-20 16:39
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- start
- 스위프트
- 공부
- 기초
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---

## Basic Operators (기본 연산)

### 간단한 용어 정리
- **Unary Operator (단항 연산자)**: 항이 한개 밖에 없는 연산
  - **Prefix (전위 표기법)**: -a
  - **Postfix (후위 표기법)**: c! 
- **Binary Operator (이항 연산자)**: 항이 두개인 연산
  - **Infix (중위 표기법)**: a + b
- **Ternary Operator (삼항 연산자)**: 항이 새개인 연산
  - a > 0 ? "positive" : "negative"

### Assignment Operators (할당 연산자)
변수에 값을 할당할때 특정한 값을 할당 하는것 외에 연산과 동시에 값을 할당할 수 있다.
```swift
// 기본적으로 아래와 같이 특정한 값을 할당 할 수 있다.
var value = 0

// 아래와 같이 연산과 동시에 할당 할 수 있다.
value = value + 10
value = value - 5
value = value * 2
value = value / 2
value = value % 2

// 위의 연산 할당을 아래와 같이 간단하게 할 수 있다.
value += 10
value -= 5
value *= 2
value /= 2
value %= 2
```

> 다른 언어에서 쓰이는 `a++`는 Swift에서 쓸 수 없다.

### Arithmetic Operators (수리 연산)
스위프트도 다른언어에서 쓰는 대부분의 수리 연산을 사용할 수 있다. 
```swift
// Unary plus opertor (단항 더하기)
+a

// Addition Operator (더하기)
a + b
“Hello, “ + “world”

// Unary minus Operator (단항 빼기)
-a

// Subtraction Operator (빼기)
a - b

// Multiplication Operator (곱하기)
a * b

// Division Operator (나누기)
b / a

// Modulo operator (나누고 남은 값)
b % a
```


### Overflow Operators
정해진 타입의 최대 혹은 최소의 값을 초과할대 Overflow 오류가 발생한다. 특수한 상황에서 이러한 Overflow가 아닌 초과된 값을 계산하고 싶을때는 `&`를 이용하면 된다.
```swift
var add: Int8 = Int8.max &+ 1
var subtract: Int8 = Int8.min &- 1
```

### Comparison Operators (비교 연산자)
같은 타입의 값을 비교할때 아래의 비교 연산자들을 사용한다.
리턴 타입은 Bool이다.
```swift
// Equal to operator (같은지 비교)
a == b

// Not equal to operator (다른지 비교)
a != b

// Greater than operator (값이 큰지 비교)
a > b

// Greater than or equal to operator (값이 크거나 같은지 비교)
a >= b

// Less than operator (값이 작은지 비교)
a < b

// Less than or equal to operator (값이 작거나 같은지 비교)
a <= b
```

### Logical Operators (논리 연산자)
**논리연산자**에는 크게 And, Or, Not이 있다.<br /><br />
**And Operator**: 둘 다 참일때 참

| A | B | Result |
| :------------: | :-----------: | :-------------------: |
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | F |

---

**OR Operator**: 둘중에 하나라도 참이면 참

| A | B | Result |
|:------:|:------:|:------:|
| T | T | T |
| T | F | T |
| F | T | T |
| F | F | F |

---

**Not Operator**: 참이면 거짓으로, 거짓으면 참으로

|    A    | Result |
|:------: |:------:|
| T       |      F |
| F       |      F |

<br />
```swift
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  print(“Open the door”)
} else {
  print(“Can’t open the door”)
}
```
<figcaption class="caption">간단한 예제</figcaption>

논리 연산에서 **순서**는 매우 중요하다.

### Ternary Conditional Operator (3항 연산자)
```swift
a > 0 ? "positive" : "zero or negative"
//아래와 같음
if a>0 {
    "positive"
} else {
    "zero or negative"
}
```

### Range Operators (범위 연산자)
#### Closed Range Operator
0...100 이런식으로 사용 (0이상 100이하)

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
```
<br />
#### Half-Open Range Operator
0..<100 이런식으로 사용 (0이상 100미만)

```swift
let names = ["Anna", "Alex", "Brain", "Jack"]
let count = names.count
for i in 0..<count { //index가 0부터 시작하기 때문에 count미만으로 실행해야함
    print(i)
}
```
<br />
#### One-Sided Ranges
시작값 혹은 마지막 값을 지정해주어 범위를 지정함
1... / ...100 / ..<100 

```swift
names[2...] //Brain, Jack
names[...2] //Anna, Alex, Brain
names[..<2] //Anna, Alex
```
<br />

> 원하는 배열이나 데이터를 반대로 출력하고 싶을때 **reversed**함수 사용
```swift
for i in (1...100).reversed() {
    print(i)
}
```

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

## Basic Operators (기본 연산)

### 간단한 용어 정리
- **Unary Operator (단항 연산자)**: 항이 한개 밖에 없는 연산
  - **Prefix (전위 표기법)**: -a
  - **Postfix (후위 표기법)**: c! 
- **Binary Operator (이항 연산자)**: 항이 두개인 연산
  - **Infix (중위 표기법)**: a + b
- **Ternary Operator (삼항 연산자)**: 항이 새개인 연산
  - a > 0 ? "positive" : "negative"

### Assignment Operators (할당 연산자)
변수에 값을 할당할때 특정한 값을 할당 하는것 외에 연산과 동시에 값을 할당할 수 있다.
```swift
// 기본적으로 아래와 같이 특정한 값을 할당 할 수 있다.
var value = 0

// 아래와 같이 연산과 동시에 할당 할 수 있다.
value = value + 10
value = value - 5
value = value * 2
value = value / 2
value = value % 2

// 위의 연산 할당을 아래와 같이 간단하게 할 수 있다.
value += 10
value -= 5
value *= 2
value /= 2
value %= 2
```

> 다른 언어에서 쓰이는 `a++`는 Swift에서 쓸 수 없다.

### Arithmetic Operators (수리 연산)
스위프트도 다른언어에서 쓰는 대부분의 수리 연산을 사용할 수 있다. 
```swift
// Unary plus opertor (단항 더하기)
+a

// Addition Operator (더하기)
a + b
“Hello, “ + “world”

// Unary minus Operator (단항 빼기)
-a

// Subtraction Operator (빼기)
a - b

// Multiplication Operator (곱하기)
a * b

// Division Operator (나누기)
b / a

// Modulo operator (나누고 남은 값)
b % a
```


### Overflow Operators
정해진 타입의 최대 혹은 최소의 값을 초과할대 Overflow 오류가 발생한다. 특수한 상황에서 이러한 Overflow가 아닌 초과된 값을 계산하고 싶을때는 `&`를 이용하면 된다.
```swift
var add: Int8 = Int8.max &+ 1
var subtract: Int8 = Int8.min &- 1
```

### Comparison Operators (비교 연산자)
같은 타입의 값을 비교할때 아래의 비교 연산자들을 사용한다.
리턴 타입은 Bool이다.
```swift
// Equal to operator (같은지 비교)
a == b

// Not equal to operator (다른지 비교)
a != b

// Greater than operator (값이 큰지 비교)
a > b

// Greater than or equal to operator (값이 크거나 같은지 비교)
a >= b

// Less than operator (값이 작은지 비교)
a < b

// Less than or equal to operator (값이 작거나 같은지 비교)
a <= b
```

### Logical Operators (논리 연산자)
**논리연산자**에는 크게 And, Or, Not이 있다.<br /><br />
**And Operator**: 둘 다 참일때 참

| A | B | Result |
| :------------: | :-----------: | :-------------------: |
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | F |

---

**OR Operator**: 둘중에 하나라도 참이면 참

| A | B | Result |
|:------:|:------:|:------:|
| T | T | T |
| T | F | T |
| F | T | T |
| F | F | F |

---

**Not Operator**: 참이면 거짓으로, 거짓으면 참으로

|    A    | Result |
|:------: |:------:|
| T       |      F |
| F       |      F |

<br />
```swift
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  print(“Open the door”)
} else {
  print(“Can’t open the door”)
}
```
<figcaption class="caption">간단한 예제</figcaption>

논리 연산에서 **순서**는 매우 중요하다.

### Ternary Conditional Operator (3항 연산자)
```swift
a > 0 ? "positive" : "zero or negative"
//아래와 같음
if a>0 {
    "positive"
} else {
    "zero or negative"
}
```

### Range Operators (범위 연산자)
#### Closed Range Operator
0...100 이런식으로 사용 (0이상 100이하)

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
```
<br />
#### Half-Open Range Operator
0..<100 이런식으로 사용 (0이상 100미만)

```swift
let names = ["Anna", "Alex", "Brain", "Jack"]
let count = names.count
for i in 0..<count { //index가 0부터 시작하기 때문에 count미만으로 실행해야함
    print(i)
}
```
<br />
#### One-Sided Ranges
시작값 혹은 마지막 값을 지정해주어 범위를 지정함
1... / ...100 / ..<100 

```swift
names[2...] //Brain, Jack
names[...2] //Anna, Alex, Brain
names[..<2] //Anna, Alex
```
<br />

> 원하는 배열이나 데이터를 반대로 출력하고 싶을때 **reversed**함수 사용
```swift
for i in (1...100).reversed() {
    print(i)
}
```

