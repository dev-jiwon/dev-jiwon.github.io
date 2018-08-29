---
title: "마크다운 사용 설명서"
layout: post
date: 2018-05-16 10:15
image: https://i.imgur.com/BByyOpG.png
headerImage: true
tag:
- 마크다운
- markdown
- md
- 깃허브
- github
- 링크
- 리스트
- 문법
- 이미지
category: blog
author: JIWON
description: 맥북 유저에게 유용
---
# 공식 [GitHub Mastering Markdown](https://guides.github.com/features/mastering-markdown/) 번역
---
# 목차
- #### [마크다운이란](#whatismarkdown)
- #### [예제](#example)
  -  [Text](#exText)
  - [Lists](#exLists)
  - [Images](#exImages)
  - [Headers & Quotes](#exHeaders)
  - [Code](#exCode)
  - [Extras](#exExtras)
- #### [문법가이드](#guides)
  - [헤더](#gdHeaders)
  - [강조](#gdEmphasis)
  - [리스트](#gdLists)
    - [순서 있는 리스트](#listNum)
    - [순서 없는 리스트](#listNon)
  - [이미지](#gdImages)
  - [링크](#gdLinks)
  - [인용구](#gdQuotes)
  - [인라인 코드](#gdInline)
- #### [Github 스타일 마크다운](#githubmarkdown)
  - [강조 문법](#gitEmphasis)
  - [작업 목록](#gitLists)
  - [표](#gitTables)
  - [SHA 참조](#gitSHA)
  - [저장소 내에서의 이슈 참조](#gitIssues)
  - [사용자 이름을 태그 @mentions](#gitTags)
  - [URL 자동 링크](#gitURL)
  - [취소선](#gitStrikethrough)
  - [이모티콘](#gitEmoji)

---
<br />
# <a id="whatismarkdown"></a> 마크다운이란
**마크다운**은 웹에서 텍스트의 스타일을 지정하는 방법입니다. 문서의 스타일을 제어합니다. 굵게 또는 기울임 글꼴로 단어 서식을 지정하고, 이미지를 추가하고, 목록을 만드는 작업은 마크다운에서 할 수있는 몇 가지 작업입니다. 마크다운의 대부분은 알파벳이 아닌 ``#``, ``*``와 같은 문자가 몇개있는 일반 텍스트입니다.

마크다운을 GitHub의 대부분의 장소에서 사용할 수 있습니다:

- [요령](https://gist.github.com/discover)
- Issues 해설, Pull Requests
- **.md** 또는 **.markdown** 확장자를 가진 파일

자세한 내용은 GitHub 도움말의 “[Writing on GitHub](https://help.github.com/categories/writing-on-github/)”를 참조하십시오.

# <a id="example"></a>예제
## <a id="exText"></a>Text
~~~
마크다운을 이용해 아주 쉽게 **볼드체**와 *이탤릭체*를 만들 수 있고, 심지어 [구글로 링크를 걸 수 있다](http://google.com).
~~~
마크다운을 이용해 아주 쉽게 **볼드체**와 *이탤릭체*를 만들 수 있고, 심지어 [구글로 링크를 걸 수 있다](http://google.com).

## <a id="exLists"></a>Lists
~~~
순서 있는 리스트:

1. One
2. Two
3. Three

글머리 기호 있는 리스트:

* "별( * )"로 시작한다
* Profit!

혹은 다음 같이 사용할 수 있다,

- 이와 같이 하이픈( - )을 이용 할 수 있다.
- 만약 서브 리스트가 있다면 시작할때 두번 띄어쓰기를 하고 하이픈이나 별을 이용해 리스트를 만든다:
  - Like this
  - And this
  ~~~
  순서 있는 리스트:

  1. One
  2. Two
  3. Three

  글머리 기호 있는 리스트:

  * "별( * )"로 시작한다
  * Profit!

  혹은 다음 같이 사용할 수 있다,

  - 이와 같이 하이픈( - )을 이용 할 수 있다.
  - 만약 서브 리스트가 있다면 시작할때 두번 띄어쓰기를 하고 하이픈이나 별을 이용해 리스트를 만든다:
    - 이렇게
    - 그리고 이렇게

## <a id="exImages"></a>Images
```
이미지를 삽입하고 싶다면 다음과 같이 삽입할 수 있다.

![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)
```
이미지를 삽입하고 싶다면 다음과 같이 삽입할 수 있다.

![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)

## <a id="exHeaders"></a>Headers & Quotes
```
# 구조화된 문서 작성

구조화된 문서를 작성할때 문장을 '#'으로 시작해 제목을 설정 할 수 있고, 여러개의 '#'을 이용해 더 작은 글씨로 낮은 레벨의 소제목을 정할 수 있다.

### 이것은 세번째 계층의 제목입니다.

다른 계층의 제목을 위해 '#'을 최대 6개까지 사용할 수 있습니다.

누군가를 인용하고 싶다면 라인 앞에> 문자를 사용하십시오 :

> Coffee. The finest organic suspension ever devised... I beat the Borg with it.
> - Captain Janeway
```
# 구조화된 문서 작성

구조화된 문서를 작성할때 문장을 '#'으로 시작해 제목을 설정 할 수 있고, 여러개의 '#'을 이용해 더 작은 글씨로 낮은 레벨의 소제목을 정할 수 있다.

### 이것은 세번째 계층의 제목입니다.

다른 계층의 제목을 위해 '#'을 최대 6개까지 사용할 수 있습니다.

누군가를 인용하고 싶다면 라인 앞에> 문자를 사용하십시오 :

> Coffee. The finest organic suspension ever devised... I beat the Borg with it.
> - Captain Janeway

##  <a id="exCode"></a>Code
There are many different ways to style code with GitHub's markdown. If you have inline code blocks, wrap them in backticks: `var example = true`.  If you've got a longer block of code, you can indent with four spaces:

    if (isAwesome){
      return true
    }

GitHub also supports something called code fencing, which allows for multiple lines without indentation:

```
if (isAwesome){
  return true
}
```

And if you'd like to use syntax highlighting, include the language:

```javascript
if (isAwesome){
  return true
}
```

## <a id="exExtras"></a>Extras
GitHub supports many extras in Markdown that help you reference and link to people. If you ever want to direct a comment at someone, you can prefix their name with an @ symbol: Hey @kneath — love your sweater!

But I have to admit, tasks lists are my favorite:

- [x] This is a complete item
- [ ] This is an incomplete item

When you include a task list in the first comment of an Issue, you will see a helpful progress bar in your list of issues. It works in Pull Requests, too!

And, of course emoji! :sparkles: :camel: :boom:

---
# <a id="guides"></a>문법 가이드
다음은 GitHub.com 어디에서나 사용할 수있는 Markdown 문법 개요입니다.

## <a id="gdHeaders"></a>헤더(Headers)
~~~
  # 이것은 <h1> 태그 입니다.
  ## 이것은 <h2> 태그 입니다.
  ###### 이것은 <h6> 태그 입니다.
~~~

## <a id="gdEmphasis"></a>강조
~~~
*이것은 이탤릭체가 될 것입니다.*
_이것 또한 이탤릭체가 될 것입니다._

**이것은 볼드체가 될 것입니다.**
__이것 또한 볼드체가 될 것입니다.__

_이렇게 **섞어서** 사용할 수 있습니다._
~~~

## <a id="gdLists"></a>리스트
### <a id="listNum"></a>순서 있는 리스트
~~~
1. Item 1
1. Item 2
1. Item 3
   1. Item 3a
   1. Item 3b
~~~
### <a id="listNon"></a>순서 없는 리스트
~~~
* Item 1
* Item 2
  * Item 2a
  * Item 2b
  ~~~

## <a id="gdImages"></a>이미지
~~~
![GitHub Logo](/images/logo.png)
포맷: ![이미지 설명](url주소 로컬/온라인)
~~~

## <a id="gdLinks"></a>링크
~~~
http://github.com - 주제를 지정하지 않을때 자동으로 가능
[GitHub](http://github.com)
~~~

## <a id="gdQuotes"></a>인용구
~~~
As Kanye West said:

> We're living the future so
> the present is our past.
~~~

## <a id="gdInline"></a>인라인 코드
~~~
I think you should use an
`<addr>` element here instead.
~~~
---

# <a id="githubmarkdown"></a> Github 스타일 마크다운
GitHub.com은 기존 마크다운에서 추가적인 기능을 더한 GitHub만의 마크다운 문법을 이용해 보다 쉽고 편리하게 GitHub.com의 컨텐츠로의 작업할 수 있게 만들었습니다.

GitHub만의 마크다운 일부 기능은 Issues 및 Pull Request의 설명 과 서술에서만 사용할 수 있습니다. 여기에는 @mentions 뿐만 아니라 SHA-1 해시, 문제점 및 끌어 오기 요청에 대한 참조가 포함됩니다. 작업리스트는 Gist 주석과 Gist Markdown 파일에서도 사용할 수 있습니다.

## <a id="gitEmphasis"></a>강조 문법
다음은 [GitHub Flavored Markdown](https://help.github.com/articles/basic-writing-and-formatting-syntax/)에서 **구문 강조**를 사용하는 방법의 예입니다:
~~~
 ```javascript
 function fancyAlert(arg) {
   if(arg) {
     $.facebox({div:'#foo'})
   }
 }
 ```
~~~
네번의 띄어쓰기로 편하게 code를 입력할 수 있습니다
~~~
    function fancyAlert(arg) {
      if(arg) {
        $.facebox({div:'#foo'})
      }
    }
~~~
다음은 구문 강조 없는 python 코드 예제입니다.
~~~
def foo():
    if not bar:
        return True
~~~

## <a id="gitLists"></a>작업 목록 (Task Lists)
```
- [x] @mentions, #refs, [links] (), ** 서식 지정 ** 및 <del> 태그 </ del>가 지원됩니다.
- [x] 목록 구문이 필요합니다 (순서가 지정되지 않은 또는 정렬 된 목록이 지원됨).
- [x] 완료한 아이템
- [ ] 아직 완료하지 못한 아이템
```
Issue의 첫 번째 코멘트에 작업 목록을 포함 시키면 이슈 목록에 편리한 진행 표시가 나타납니다. Pull Requests에서도 작동합니다!

## <a id="gitTables"></a>표(Tables)
첫번쨰 행의 단어 목록을 조합하여 하이픈( - )으로 나누고, 파이프( | )로 각 열을 분리하면 테이블을 만들 수 있습니다.
~~~
First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column
~~~
**결과물**
First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column

## <a id="gitSHA"></a>SHA 참조
[SHA-1 hash](https://en.wikipedia.org/wiki/SHA-1) 는 자동으로 GitHub에 커밋에 대한 링크로 변환됩니다.
~~~
16c999e8c71134401a78d4d46435517b2271d6ac
mojombo@16c999e8c71134401a78d4d46435517b2271d6ac
mojombo/github-flavored-markdown@16c999e8c71134401a78d4d46435517b2271d6ac
~~~

## <a id="gitIssues"></a>저장소 내에서의 이슈 참조
이슈 또는 Pull Request 요청의 모든 번호가 자동 링크로 변환됩니다.
~~~
#1
mojombo#1
mojombo/github-flavored-markdown#1
~~~

## <a id="gitTags"></a>사용자 이름을 태그 @mentions
```@``` 기호 다음에 사용자 이름을 입력하면 그 사람에게 와서 볼 수 있도록 알립니다. 이것은 개인을 언급하고 있기 때문에 "@mentions"라고 부릅니다. 또한 조직 내에서 팀을 @mention 할 수 있습니다.

## <a id="gitURL"></a>URL 자동 링크
모든 URL(예: ```http://github.com```)은 자동으로 클릭 가능한 링크로 변환됩니다.

## <a id="gitStrikethrough"></a>취소선
```~~취소선~~```같이 물결표 두개로 감싼 단어는 취소선이 쳐진 것처럼 보입니다.

## <a id="gitEmoji"></a>이모티콘
GitHub는 [이모티콘](https://help.github.com/articles/basic-writing-and-formatting-syntax/#using-emoji)을 지원합니다! :sparkles: :camel: :boom:
우리가 지원하는 모든 이미지 목록을 보려면 [Emoji Cheat Sheet](http://www.emoji-cheat-sheet.com/)를 확인하십시오.
