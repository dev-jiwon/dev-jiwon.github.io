---
title: "스위프트 문법 6 (제어 이동문)"
layout: post
date: 2018-05-23 16:36
image: /assets/images/Swift_logo.png
headerImage: true
tag:
- swift
- Control Transfer Statement
- continue
- return
- break
- fallthrough
- throw
- Labeled
- for
- func
- 스위프트
- 공부
- 문법
- 제어 이동문
category: blog
author: JIWON
description: 스위프트의 기본 문법들
---
# Control Transfer Statement (제어 이동문)
- 특정 코드에서 다른 코드로 제어를 이전하여 코드 실행 순서를 변경하는 것
- Swift 에는 5가지 키워드 사용
  - continue
  - return
  - break
  - fallthrough
  - throw
  
## Continue
**for문**에서 **continue**가 실행되면 더이상 아래로 진행되지 않고 다시 for 문으로 돌아간다.

```swift
for num in 0...8 {
    if num % 2 == 0 {
        continue
    }
    print(num)
}
//1 3 5 7
```

<br />

## Return
**함수**에서 **return**이 실행되면 return될 값을 return하고 함수를 **종료** 시킨다.

```swift
func isEven(num: Int) -> Bool {
  if num % 2 == 0 {
    return true
  }
  return false
}

isEven(num: 1) // false
isEven(num: 2) // true
```

<br />

## Break
**for문**에서 **break**가 실행되면 더이상 진행되지 않고 for문이 **종료**됨

```swift
for i in 0...3 {
    for j in 0...3 {
        if i > 1 {
            break
        }
        print(" inner \(j)") //8번 실행됨
    }
    print("outer \(i)") //4번 실행됨
}
```

<br />

## Labeled
**for문**에 **이름**을 붙여주고 **break**나 **continue**를 이름에 붙여 사용, 하지만 잘 안 쓰임

```swift
OUTER: for i in 0...3 { //이렇게 이름을 붙여줌
    INNER: for j in 0...3{
        if i > 1 {
            break OUTER
        }
        print(" inner \(j)")
    }
    print("outer \(i)")
}
```

