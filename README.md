# YogiYoCloneIOS

### 패스트 캠퍼스 팀프로젝트

사용 라이브러리 
- Alamofire
- Snapkit
- Cosmos
- Kingfisher
- Firebase/Auth

<div>
  
---
표건욱
## HomeVC

---
김믿음
## StoreListVC

---

김동현 (팀장)

## MenuListVC
<center>
  
</center>
<center><img width="200" alt="7" src="https://user-images.githubusercontent.com/63357508/91789874-7c938880-ec4a-11ea-893b-4d8ce2a6d127.png"></center>  

## AccountVC, LoggedAccountVC
<center>
  
</center>
<center><img width="200" alt="1" src="https://user-images.githubusercontent.com/63357508/91789872-7bfaf200-ec4a-11ea-90d6-c3921b85ffe3.PNG">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/91789863-79989800-ec4a-11ea-8aa6-5323b9d3e3de.PNG"></center>

## LogVC, AcceptVC, PhoneAcceptVC
<center>
  
</center>
<center><img width="200" alt="2" src="https://user-images.githubusercontent.com/63357508/91789869-7b625b80-ec4a-11ea-82cd-44512526d4e4.PNG">
<img width="200" alt="3" src="https://user-images.githubusercontent.com/63357508/91789866-7ac9c500-ec4a-11ea-9aa7-0e907792996e.PNG">
<img width="200" alt="4" src="https://user-images.githubusercontent.com/63357508/91789852-743b4d80-ec4a-11ea-8b1b-75ae61136261.PNG"></center>


## ProfileEditVC
<center>
  

</center>
<center><img width="200" alt="6" src="https://user-images.githubusercontent.com/63357508/91789865-7ac9c500-ec4a-11ea-90ad-5987145bc22e.PNG"></center>

---
변윤나

## DetailMenuVC, OrderVC

<div>
<img width="200" src="https://qussk.github.io/image/gif/yogi1.gif">
<img width="200" src="https://qussk.github.io/image/gif/yogi4.gif">
<img width="200" src="https://qussk.github.io/image/gif/yogi3.gif">
</div>

- REST API
- 주요기능 : 메뉴 옵션(필/선) 및 수량선택. 결제기능
- 사용된 라이브러리 : Kingfisher  
- autoLayout : Anchor

```
- 메뉴선택 -> 주문기능 과정에서 menuAPI를 받는 MenuData모델을 만들고 주문시 OrderData모델을 연동하여 주문데이터가 따로 관리되도록 구현(Codable이용).
- 주문이후 전체적인 주문정보를 관리하는 매니저(데이터 모델)인 OrderMager를 싱글톤으로 만들어 orderList 배열에 저장, 리턴, 초기화 기능을 추가하여 하위 주메뉴,옵션명,수량,totalPrice등을 효율적으로 관리함.
- 옵션,필수등의 체크사항은 데이터에 따라 mandatory(true,false), name, price데이터가 변동되는 것을 고려하여 row와 section값에 직접 접근하여 처리.(필수옵션 - 단일선택, 선택옵션 - 다량선택을 위한 액션은 프로토콜로 처리). 
- 다시 주문화면으로 돌아가 User가 옵션에 대해 체크해제할 경우 데이터 remove(at: index)처리함.(배열에서 삭제) 

```


## ShareVC
<div>
<img width="200" alt="2" src="https://qussk.github.io/image/gif/yogi2.gif">
<img width="200" alt="5" src="https://qussk.github.io/image/gif/yogi5.gif">
</div>

- 카카오SDK
- 주요기능 : 공유하기 - url Scheme, 클립보드 복사
- Layout : frame

```
- 카카오SDK을 통해 id와 kakaoScheme이용헤 kakaolink처리. 
- 클립보드복사 : UIPasteboard 이용하여 처리.
```


## SearchVC

<div>
<img width="200" src="https://qussk.github.io/image/gif/yogi6.gif">
</div>

- REST API
- 주요기능 : 매장명, 음식명 검색
- autoLayout : Anchor

```
- Textfield in navigationBar
- url의 String포함을 addingPercentEncoding로 처리하여 url사용.
- 함수에 text인자 값을 받아 "http://52.79.251.125/restaurants?search=\(text ?? "")"처리.
```

---

</div>
