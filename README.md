# YogiYoCloneIOS

### 패스트 캠퍼스 팀프로젝트

사용 라이브러리 
- Alamofire
- Snapkit
- Cosmos
- Kingfisher
- Firebase/Auth
- SwiftyJSON

#### 소감 한마디
---

표건욱 - 



김믿음 - 
매장 리스트와 주문내역뷰를 구현하면서 백엔드 팀과 함께 REST API 를 활용하여 실제 데이터를 네트웍을 통해 요청/응답하는것에 대한 이해를 높일수 있었다. 그리고, 프로젝트를 진행하면서 개인적으로 뷰를 좀더 수월하게 그리는 방법을 알게 되었고, 특히 MVC 패턴을 적용하면서 그동안 못하였던 코드의 간결화도 적용할 수 있었습니다. 프로젝트를 진행하면서 코로나 19로 인해 온라인으로만 소통을 진행해야 해서 답답한 부분이 많았을텐데 각자 맡은 부분 성실하게 해주어 프로젝트가 수월하게 진행됐습니다. 



김동현(팀장) -
파이어베이스에서나 해봤을 회원 관리 프로세스를 백엔드팀과 협업을 진행함으로써 개인적으로 많이 성장하였다고 생각합니다. 각 case 마다의 statuscode를 공유 요청하여 client 에서도 각 상황에 맞는 대응을 준비할수 있는 최대한 restful한 작업이 되게 노력하였고, 또한 슬랙을 통하여 response 받은 stautscode를 가지고 서버 error와, client error를 공유하면서 즉각 대응 하며 작업을 진행함으로써 협업의 묘미를 느낄수 있는 계기 되었습니다.


변윤나 -


<div>
  
#### View
---
표건욱
## HomeVC

---
김믿음
## StoreListVC
```
사용자가 지정한 지역의 매장 데이터를 가져오는 것으로 상단 카테고리는 UISegmentControl을 Custom 하여 구현
하단 페이징은 UIScrollView UITableView와 UITableViewCell 을 Customg하여 Paging 구현
UITableViewCell 내에는 Alanofire 라이브러리를 사용하여 데이터를 GET 방식으로 Fetch
필터 기능은 Delegate를 활용하여 UIView 로 구성하였으며, 각 필터를 누를 때마다 필터된 데이터를 받아와 TableView 가 Reload 되도록 구현 
```

## HistoryVC 
```
사용자가 주문한 내역 데이터를 가져오는 화면으로 상단 카데고리는 StoreVC 와 동일하게 UISegmentControl 를 사용하였고, 
하단 페이징 화면도 StoreVC 와 동일하게 구현하되, 데이터가 없는경우 EmptyPage를 만들어 주문하기를 클릭하면
매장 리스트로 갈수 있도록 구현
```
<center>
<img width="200" alt="7" src="https://user-images.githubusercontent.com/61490943/95412869-e5b29e00-0964-11eb-9375-b2b0a5681319.gif">
</center>

---
김동현

## MenuListVC
```
UICollectionViewFlowLayout을 custom 하여 StretchHeader를 구현
해당 점포의 정보와 메뉴들을 parsing하여 view 구성 
expandable한 tableView를 사용하여 메뉴 리스트 구성
```
<center>
<img width="200" alt="7" src="https://user-images.githubusercontent.com/63357508/95325300-f539d480-08db-11eb-8021-fd5aa8b07752.gif">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/63357508/95326047-f3244580-08dc-11eb-97c8-00ae69fddc20.gif">
<img width="200" alt="7" src="https://user-images.githubusercontent.com/63357508/95326151-164ef500-08dd-11eb-86e7-db04f6a12581.gif">
</center>  

## AccountVC, LoggedAccountVC, LogVC, SignUpVC, PhoneAcceptVC, ProfileEditVC, ChangeNickNameVC
```
email, password, nickname을 post 후에 서버에서 동일한 email이 사용되고 있는지 체크 
사용중인 이메일이 아니라면 비활성화된 유저를 서버에서 생성하고 id, token 반환  
FCM을 활용한 전화번호 인증을 완료후 반환받은 id를 사용하여 patch하면
해당 비활성화 유저의 전화번호 정보가 patch 되어지고
활성화 유저로 변경 해당 유저의 id를 사용하여 유저의 데이터를 get한 후에 app내에서 
정의해놓은 User 타입의 구조로 user 생성
```
<center>
<img width="200" alt="1" src="https://user-images.githubusercontent.com/63357508/95326269-44ccd000-08dd-11eb-9aae-3ff8cabc8695.gif">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95326435-8b222f00-08dd-11eb-9fbd-3ba7f0ccc923.gif">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95326699-f0762000-08dd-11eb-8236-d38c870bf649.gif">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95327497-1b14a880-08df-11eb-9306-fe001fe08a07.gif">

</center>
<center>
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95327853-a3934900-08df-11eb-8eb4-4baa8b07a058.gif">
</center>
<center>
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95326973-5d89b580-08de-11eb-9556-66180a25f582.gif">
<img width="200" alt="5" src="https://user-images.githubusercontent.com/63357508/95328033-e9501180-08df-11eb-8723-28191f7c1703.gif">
</center>

---
변윤나

## DetailMenuVC

---

</div>
