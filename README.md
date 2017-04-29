# enrollment

## About this gem
 이 패키지는 모든 신청에 대한 프론트와 백엔드를 구현하는 것을 목표로 합니다.  
 이 패키지는 다음의 사례에 유용하게 쓰일 것입니다.
 - 수강신청 시스템이 필요한 프로젝트
 - 물품 구매 시스템을 만들어야 하는 프로젝트
 - 주기적으로 받아야 하는 예약 시스템
 - 티케팅 시스템


 이를 위해서는 다음의 기능이 필요합니다.
 - 사용자 페이지
   - 신청 가능한 목록을 표시
   - 항목에 들어가면 이미지와 정보 출력
 - 전체 관리자 페이지
   - 카테고리/목록 관리
   - Lecture 관리자 임명, 퇴출
 - 부분 관리자 페이지
   - 신청 목록 만들기
     - 마감 조건 설정: 기간 설정, 수량
     - 이미지와 정보 입력, 생성
     - CRUD

## Development FrameWork
- Backend: ruby on rails
- Frontend: React.js & HTML ***....***
- Database : Sqlite3, Postgre  

### Using Pakage
- will_paginate
- devise

## Database ERD  
<!--문서 변경사항에 따라 수정 필요-->
* 1단계 분류 : 전체 캠퍼스(매장) 테이블  
  - Schema : 캠퍼스(지역)구분 | 캠퍼스명  
  - ex) 용인 | 죽전캠퍼스  
  - ex) 서울 | 압구정점  

* 2단계 분류 : 단과대(재고분류)별 테이블  
  - Schema : 단과대(매장)명 | 소속과(재고분류)  
  - ex) 외국어대 | 영문과  
  - ex) 반포점 | 의류  

* 3단계 분류 : 과별시간표(재고목록) 테이블  
  - Schema : 각 Col명  
    - 학교 - 과목명 | 이수구분 | 교수명 | 학점 | 요일 | 시간 | 강의실 | 잔여석 ***...***  
    - 매장 - 제품명 | 사이즈 | 색상 | 재고량 | ***...***  

* +전체보기 : 모든과목(제품) 한번에 보기  
  - Schema : 각 Col명  
  - 학교 - 과목명 | 이수구분 | 교수명 | 학점 | 요일 | 시간 | 강의실 | 잔여석 ***...***    
  - 매장 - 제품명 | 사이즈 | 색상 | 재고량 | ***...***  

* 각 Col별 테이블
  * Mypage(학생시간표,장바구니,교수시간표,직원별판매전표,강의실시간표,지점별판매전표)  
  - Schema : 전체보기와 동일  

## Database Schema
<!--빠진 부분이 있는지 살펴주기 바람-->
### Category
```ruby
t.string   :name
#t.string   :route_name
t.text     :info
```
info는 html_safe를 걸어서 아무 말이나 넣을 수 있게 하자

### Lecture
```ruby
t.string   :name
t.string   :info
t.string   :url
t.text     :content
t.datetime :time_limit_start
t.datetime :time_limit_end
t.integer  :personnel_limit
t.string   :limit_on_ruby
t.integer  :admin_id
t.integer  :category_id
```

time_limit: 수강 시간 제한  
personnel_limit: 수강 인원 제한  
limit_on_ruby: 여기에 루비 문법을 넣으면, 그 루비 문법대로 실행되어 제한을 건다.

앞선 Course와 Category와 다르게 설명하는 부분은 info와 content 두 부분이다. info에는 중요한 정보(강의실, 학점...)가 먼저 노출되는 자리이고, content는 이제 이미지나 내용을 이용해서 구구절절 설명하는 부분이다.

수강이 완료되어 강의실에 들어가기 버튼을 누르면 url로 연결해준다.

### Enroll
```ruby
t.integer :user_id
t.integer :lecture_id
```
### LectureAdmin
```ruby
t.integer :user_id
t.integer :lecture_id
```
## Naming rules  
<!--최대한 추상적으로 광범위하게 기술 바람-->
-  이름의 구분자는 _ 로 한다(-와 PascalCase, camelCase 를 사용하지 않는다)
-  이름은 최대한 수강신청에 알맞는 어감으로 해야 한다.(shopping -> enroll, item-> lecture)
-  boolean을 반환하는 메소드 끝에는 물음표를 붙인다.
-  다음의 단어를 위주로 배치한다.
    - enroll (등록하다)
    - category (lecture의 묶음)
    - lecture  (신청할 대상 / 쇼핑몰의 경우 상품)
    - limit (수강 제한의 의미)
    - authentication (권한 제한의 의미)


## Routes
<!--route.rb 처럼 기술하기 바람-->
scaffold의 route를 참고하여 작성하기 바람  
![scaffold post 할시 route](http://asset.blog.hibrainapps.net/saltfactory/images/fbc02a0b-dd64-4ad1-adfb-2be79890f646)
```ruby
root 'categories#index'

{post: 'create', put: 'update', delete: 'destroy'}.each do |method, crud|
  ['categories', 'lectures'].each do |name|
    send(method, {'/api/'+crud+'/'+name+'/:'+name+'_route' => name+'#'+crud})
  end
end

{post: 'create', delete: 'destroy'}.each do |method|
  ['enrolls','lecture_admins'].each do |name|
    send(method, {'/api/'+crud+'/'+name+'/:'+name+'_route' => name+'#'+crud})
  end
end

get '/categories/:id' => 'categories#show'
get '/categories/new' => 'categories#new'
put '/categories/:id' => 'categories#update'
get '/lectures/:id' => 'lectures#show'
get '/lectures/new' => 'lectures#new'
put '/lectures/:id' => 'lectures#update'

#page for admin of all, manage for lecture_admin
get '/admin' => 'lecture_admins#show'
#page for lecture_admin, manage for attendence in lecture
get '/admin/:lecture_route' => 'enrolls#show'
```

## Class & Method structure
### Helper Method
* current_user : 현재 사용자를 반환
* can_enroll? : 신청 시간, 인원수 외에 신청 권한을 관리. 오버라이딩을 안하면 언제나 true
* is_lecture_limited?(lecture_id) : 현재 사용자가 이 수업을 신청할 수 있는지
* is_lecture_time_limited?(lecture_id) : 해당 수업의 시간이 마감됐는지
* is_lecture_personnel_limited?(lecture_id) : 해당 수업의 인원이 다 찼는지
* is_lecture_admin?(lecture_id) : 해당 수업의 관리자인지
* is_admin? : 파라미터가 없으면, 전체 관리자인지  
**ㄴ초기 설정 할때 오버라이딩으로 관리**


### Model Class

### Controller&View
#### Controller
```bash  
rails g scaffold category
rails g scaffold lecture
rails g scaffold enroll
rails g scaffold lecture_admin
```
로 4가지 클래스를 우선 생성한다.

#### View  
* lecture/index (전체 lecture 목록)  
    * **꽉찬 lecture 목록 bold or font-color 등 별도 표시  
    (=render partial 'fulled_lecture')**  
* lecture/new  
    * 개별 강의 추가 form  
* lecture/edit  
    * 권한에 따라 강의에 대해 수정 가능  
        * lecture_admin일 때 : 모두 수정 가능  
        * 교수권한일 때 : 강의계획서만 수정 가능  
* lecture/show  
    * 개별 강의에 대한 정보  


* category/index
    * 강의 분류 및 하위 강의 목록 확인  
    * **admin 권한일때만** edit페이지로 이동 가능  
* category/new  
    * **(lecture_admin권한일때만)** 새로운 카테고리 추가  
* category/edit  
    * **(lecture_admin권한일때만)** 분류에 대한 수정  
* category/show  
    * 카테고리의 정보 및 해당 카테고리의 lecture표시  
    **render partial(lectrue/index) 사용**  

* lecture_admin/index  
    * 전체 User를 보여주고 각 관리권한 확인  
* lecture_admin/new  
    * 새로운 관리자 계정 추가 and 비관리자를 관리자로 추가  
* lecture_admin/edit  
    * 관리자 권한 수정 및 삭제버튼,  
* lecture_admin/show  
    * 관리자 목록 확인 및 수정페이지로 이동  


* enroll/index  
    * 학생의 경우  
        *  
    * 교수의 경우  
        *  
* enroll/new  
    *  
* enroll/edit  
    *  
* enroll/show  
    * 수강신청한 강의정보 보여주기  

**(Route를 정하고 구체적으로 기술 바람)**
