---
title: "에어팟 맥북에서 쉽게 연결하는 방법"
layout: post
date: 2018-05-15 23:26
image: https://cdn-images-1.medium.com/max/1600/1*B97LXl3hsJQhfRogh2G3oA.png
headerImage: false
tag:
- mac
- 맥
- 에어팟
- airPods
- 쉽게
- 연결
- 호일
category: blog
author: JIWON
description: 맥북 유저에게 유용
---
![airpodsMacbook](https://cdn-images-1.medium.com/max/2000/0*4eCpwBR4zFGwDCxA.)
에어팟을 아이폰과 맥북에서 바꿔가며 사용하는데 불편하더라구요.
그러다 [호일’s Mac Life](https://m.blog.naver.com/javeri/221149175138)에서 좋은 연결 방법이 있어 조금 더 자세히 깔끔하게 정리하여 공유합니다.
> **참고!!!**
> 
> 1부터 15단계까지 차근 차근 하다보면 두개의 파일을 다운 받아야 합니다. 
제가 글을 다 쓰고 테스트하려고 다운 받아보니 사파리에서 다운이 안되네요.
구글 드라이브 링크 걸어 놨는데 ‘너무 많은 재이동으로 인하여…’ 라는 오류와 함께 다운이 되지 않습니다. 
문제 있는 파일이거나 수많은 광고를 넣어 놓은 파일이 아니기 때문에 크롬으로 맘 놓고 다운 받으셔도 됩니다!

1. 아래 Download를 눌러 압축 파일을 다운 받습니다.<br />
[Download](https://drive.google.com/file/d/1IWHZcPTbhJYckWSA-7moxMTahSHSk1ak/view?usp=sharing){: target="_blank" }

2. 다운 받은 압축 파일의 압축을 해제합니다.
3. 서 단축키 (⌘⇧ G)를 누른 뒤 [/라이브러리]를 입력합니다.
![3사진](https://cdn-images-1.medium.com/max/1600/1*lDIx_OqOSiM8Ml9gNX0sOA.png)
4. 압축 푼 BluetoothConnector 폴더를 라이브러리 폴더 안에 넣어 줍니다.
![4사진](https://cdn-images-1.medium.com/max/1600/1*nFWdb4w17HleXhWUM0yTMg.png)
5. 아래 사진의 순서를 보고 따라하며 에어팟의 주소를 복사해줍니다.
![5사진](https://cdn-images-1.medium.com/max/1600/1*ZNHmWghJNEx5nTL5Oa76_g.png)
5–1. 왼쪽 위의  모양을 누른다. <br />
5–2. 시스템 정보를 누른다. <br />
5–3. 시스템 리포트를 누른다. <br />
5–4. 하드웨어 부분에서 Bluetooth를 누른다.<br />
5–5. 자신의 AirPods를 찾고 주소를 복사한다. (00–00–00–00–00–00 형태)

6. 응용프로그램 > Automator을 실행합니다.
![6사진](https://cdn-images-1.medium.com/max/1600/1*7ui3AWswKQWmN8WklVePhg.png)
7. 새로만들기 > 응용 프로그램을 선택합니다.
![7사진](https://cdn-images-1.medium.com/max/1600/1*_nRRk8nBhYyXu0CAR16VUw.png)
8. 보관함 목록에서 쉘 스크립트실행을 더블 클릭 하고 오른쪽 창에 아래 명령어를 입력합니다.
![8사진](https://cdn-images-1.medium.com/max/1600/1*m02KGutsEmCgU2PNcY4LrQ.png)
**명령어** 
```
/Library/BluetoothConnector/BluetoothDeviceConnector 00–00–00–00–00–00
```
> 00–00–00–00–00–00 부분은 5번째에 저장해 놓은 에어팟의 주소를 붙여놓습니다
9. (⌘R)키를 눌러서 App이 정상 작동 하는지 확인합니다.
![9사진](https://cdn-images-1.medium.com/max/1600/1*C8avYPRQTEtslKLuS8Rgsw.png)
오른쪽 아래의 로그 창이 위 사진처럼 작동되면 정상 작동되는 것입니다.
> 혹시 제대로 실행되지 않는다면 BluetoothConnector폴더를 라이브러리 폴더에 잘 넣었는지 확인하고, Automator에서 명령어를 잘 입력했는지 확인해 보세요.
10. 정상작동 된다면 (⌘S)키를 눌러서 Airpod이라는 이름으로 응용 프로그램에 저장 합니다.
![10사진](https://cdn-images-1.medium.com/max/1600/1*7rV3SAmi3Nk0p14JzvStOg.png)
11. 아래 zip 파일을 다운 받고 압축을 해제합니다. (에어팟 아이콘 이미지 입니다.)
[Download](https://drive.google.com/file/d/1qb18XoAcL57YcvwA50ZSzaIyezZenJsH/view?usp=sharing){: target="_blank" }
12. 압축해제된 아이콘 이미지를 미리보기 앱으로 열어준 뒤, (⌘C)키를 눌러 이미지를 복사합니다.
![12사진](https://cdn-images-1.medium.com/max/1600/1*uJr7ZGakQ9Tgg7_t7ddFeQ.png)
13. 응용프로그램 폴더에 있는 Airpod 프로그램에서 정보 가져오기를 선택합니다.
![13사진](https://cdn-images-1.medium.com/max/1600/1*dAy7IyvY15ob_5xd9M5xaQ.png)
14. AirPod 응용프로그램의 정보에서 아이콘 모양(아래 사진의 동그라미)을 클릭하고 아이콘이 파란 빛이 날때 (⌘V)를 눌러 아이콘을 변경합니다.
![14사진](https://cdn-images-1.medium.com/max/1600/1*PzPKyglAjpfekQWIZ_tm6Q.jpeg)
15. AirPod App을 Dock에 넣어 둔 뒤, AirPod을 연결하고 싶을 때, AirPod를 착용하고, 제작한 앱을 실행하면 약 5초 뒤 Mac과 연결 됩니다.
![15사진](https://cdn-images-1.medium.com/max/1600/1*NR3XskBDoul_K7o9NzBWPA.png)
> 다 작성하고 보니 에어팟의 영어 이름은 AirPod이아니라 AirPods네요… ㅠ
어쩐지 이상하더니… ㅠ
저는 결국 파인더에서 응용 프로그램에 들어가 AirPod을 AirPods로 바꾸고 다시 Dock에 올렸습니다!

<br />
![15-1사진](https://cdn-images-1.medium.com/max/1600/1*B97LXl3hsJQhfRogh2G3oA.png)
<figcaption class="caption">디테일은 중요하지!!</figcaption> <br />
감사합니다!!