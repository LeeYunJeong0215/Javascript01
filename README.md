# 20171226

### 0. Gemfile

```
# Bootstrap4 library
gem 'bootstrap', '~> 4.0.0.beta2.1'
# Generate fake data
gem 'faker'
# Easy Paginator
gem 'kaminari'
# show rails db
gem 'rails_db', group: :development
```

```
$ bundle install
```

### 1. CRUD 만들기

- model: `board`, `user`, `comment`

- contoller: `boards`, `sessions`, route: *RESTful API*, views

  - *app/controllers/boards_controller.rb*

    - CRUD
    - action: `index`, `show`, `new`, `create`, `edit`, `update`, `destroy`

  - *app/controller/sessions_controller.rb*

    - Session
    - action: `signin`, `user_signin`, `signup`, `user_signup`

  - *config/routes.rb*

    ```
    Rails.application.routes.draw do
      # '/'
      root 'boards#index'
      # CRUD
      # C - new, create
      get '/boards/new' => 'boards#new' # new
      post '/boards' => 'boards#create' # create
      # R - index, show
      get '/boards' => 'boards#index' # index
      get '/boards/:id' => 'boards#show' # show
      # U - edit, update
      get '/boards/:id/edit' => 'boards#edit' # edit
      put '/boards/:id' => 'boards#update' # update
      # D - delete
      delete '/boards/:id' => 'boards#destroy' # destroy
    end

    ```

  - - `index.html.erb`, `show.html.erb`, `new.html.erb`, `edit.html.erb`

  - - ​

- | METHOD | 역할                                       |
  | ------ | ---------------------------------------- |
  | POST   | POST를 통해 해당 URI를 요청하면 리소스를 생성합니다.        |
  | GET    | GET를 통해 해당 리소스를 조회합니다. 리소스를 조회하고 해당 도큐먼트에 대한 자세한 정보를 가져온다. |
  | PUT    | PUT를 통해 해당 리소스를 수정합니다.                   |
  | DELETE | DELETE를 통해 리소스를 삭제합니다.                   |

### 2. jQuery 기본

- css Selector
- jQuery에 있는 기본 함수들 사용



#### bootstrap 쉽게 import하기

1. application.css의 파일을 .scss로 바꿔준 후 추가

   ```scss
   @import 'bootstrap';
   ```

2. application.js

   ```javascript
   //= require popper
   //= require bootstrap
   ```

   ​


## 20171227

### 로그인할때

* 비밀번호가 틀렸거나 이메일 틀렸을 때 알려주기(만약 둘 중에 무엇이 틀렸는지 알려주는 사이트가 있다면 보안이 취약하다고 생각하면 된다.)



### javascript

* 동적? 이미 서버로부터 받아온 html구조, 내용물을 사용자가/개발자가 원하는 형태로 바꿔준다.
* 이벤트? 사용자의 행동(클릭, 스크롤 등)
* html element? 



### javascript로 페이지 동적으로 조정하기

* 1. 이벤트

     1. HTML element 찾기

        - document.getElementById('id'): 1개(유일)
        - document.getElementsByClassName('class'): n개(배열)
        - document.getElementsByTagName('tag'): n개(배열)
        - document.querySelector('css selector'): 1개(제일 첫번째)
        - document.querySelectorAll('css selector'): n개(배열)

     2. Event Listener 설정하기

        - *HTML_element*.on이벤트명 = Handler (ex: document.onclick)
        - *HTML_element*.addEventListener('이벤트명', Handler)

     3. Event Handler 선언하기

        - 익명함수를 선언해서 사용함

        ```
        document.addEventListener('click', function() {
          // 실행문
        })
        ```




## 20171228

### jQuery

* 자바스크립트 라이브러리(라이브러리란? 자주 사용하는 코드들을 재사용할 수 있는 형태로 가공해서 프로그래밍 효율을 높여주는 코드들)

- DOM 탐색 및 수정
- 이벤트
- AJAX

를 편하게 사용할 수 있음

```
$('.className') == document.getElementsByClassName
$('#id') == document.getElementById
$('HTMLtag') == document.getElementsByTagName
```

document가 로드되기 전에 DOM을 탐색하는 것을 막기 위해서 반드시 모든 자바스크립트 코드를 `function() {}`로 감싸줘야함

```
<script>
  $(function) {
    // 실행문
  }
  혹은
  $(document).ready(function() {
    
  })
</script>
```

#### ajax로 좋아요 구현하기

좋아요를 구현하기 위해 `User`와 `Board` 모델을 n:n으로 연결하는 조인테이블을 만들어줘야 함

```
$ rails g model like
```

*db/migrate/current_time_create_like.rb*

```
class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :board_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
```

*app/models/like.rb*

```
class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
end
```

*app/models/user.rb*

```
[...]
has_many :likes
```

*app/models/board.rb*

```
[...]
has_many :likes
```

*config/routes.rb*

```
[...]
# Like
  post '/boards/:id/like' => 'boards#like_board'
```

*app/controllers/boards_controller.rb*

```
  def like_board
    user_like = Like.where(user_id: current_user.id, board_id: params[:id])
    if user_like.count > 0
      user_like.first.destroy
    else
      Like.create(
        user_id: current_user.id,
        board_id: params[:id]
      )
    end
    @like = Board.find(params[:id]).likes.count
  end
```

좋아요를 처음 눌렀을 때와 이미 눌렸을 때를 따로 처리하기 위해서 분기문으로 작성한다.

ajax로 들어온 요청에 대한 응답은 해당 컨트롤러의 이름을 가진 `js.erb`파일이다. view파일이 있는 *app/views/boards*폴더에 `like_board.js.erb`파일을 만든다.

1. application.js에 jquery가 이미 존재하므로 따로 설치해줄 것은 없음.

```javascript
//= require jquery
//= require jquery_ujs
```

