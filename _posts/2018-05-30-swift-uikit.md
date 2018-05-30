---
title: "스위프트의 UIKit"
layout: post
date: 2018-05-30 14:08
image: https://i.imgur.com/D5D9WZq.png
headerImage: true
tag:
- swift
- UIKit
- 스위프트
- 공부
category: blog
author: JIWON
description: 스위프트 UIKit 설명
---

# [UIKit](https://developer.apple.com/documentation/uikit?changes=_2)

<div class="side-by-side">
    <div class="toleft">
        <img class="image" src="https://i.imgur.com/XE73UHg.png" alt="Alt Text">
    </div>

    <div class="toright">
        <p><br />
        UIKit 프레임 워크는 iOS 또는 tvOS 앱에 필요한 인프라를 제공한다. 또, 인터페이스 구현을 위한 window, view 아키텍처, 애플리케이션에 멀티 터치 및 기타 유형의 입력을 제공하는 이벤트 처리 인프라, 사용자, 시스템 및 앱 간의 상호 작용을 관리하는 데 필요한 기본 실행 루프를 제공한다.
        <br />
        그 외에도 프레임 워크가 제공하는 다른 기능으로는 애니메이션 지원, 문서 지원, 그리기 및 인쇄 지원, 현재 장치에 대한 정보, 텍스트 관리 및 디스플레이, 검색 지원, 접근성 지원, 앱 확장 지원 및 리소스 관리가 있다.</p>
    </div>
</div>

### [UILabel](https://developer.apple.com/documentation/uikit/uilabel?changes=_2)
레이블은 우리가 일상생활에서 말하는 라벨과 같은 말이다. **사용자에게 원하는 데이터를 표시하고 싶을때** 사용한다.
> 단, 사용자는 볼 수만 있고, 수정할 수 없다.

#### 핵심 속성
**var text: String?**
Label의 text**값**
```swift
@IBOutlet weak var myLabel: UILabel!
 
myLabel = "Hi Lable"    //Label의 text를 "Hi Lable"로 변경
print(myLabel!)         //현재 Label을 가져와 출력(옵셔널이기 때문에 언래핑 함)
```

<br />

**var textColor: UIColor!**

Label의 text의 **색**, UIColor로 색을 지정할 수 있다.
```swift
myLabel.textColor = UIColor.brown //Label의 text 색을 브라운으로 변경함
```

<br />

**var textAlignment: NSTextAlignment**

Label의 text를 **Center(중앙), Left(왼쪽), Right(오른쪽)** 로 **정렬**할 수 있다.
지정할때는 **NSTextAlignment**를 이용해 지정한다.
```swift
myLabel.textAlignment = NSTextAlignment.center  //text 중앙 정렬
```

<br />

**var font: UIFont!**

text의 글꼴 및 크기를 설정한다.
설정하려는 글꼴을 UIFont를 이용해 설정하는데, 일반적으로는 `UIFont.systemFont(OfSize: 원하는 폰트 사이즈)`를 이용해 시스템의 기본 폰트에 사이즈만 변경해서 사용하지만 만약 폰트를 수정하고 싶다면 `myLabel.font = UIFont(name: 폰트이름, size: CGFloat값)`을 사용하면 된다.

```swift
myLabel.font = UIFont.systemFont(ofSize: 18)    //폰트: 시스템, 사이즈: 18
myLabel.font = UIFont(name: "Didot", size: 18)  //폰트: Didot, 사이즈: 18
```

<br />

**var numberOfLines: Int**

레이블에 표시할 **최대 행의 수**
Default는 1이며, 0을 설정할 경우 제한 없이 행을 늘릴 수 있다.
```swift
myLabel.numberOfLines = 3 //최대 행의 수를 3줄로 제한
```

---

### [UIButton](https://developer.apple.com/documentation/uikit/uibutton?changes=_2)



