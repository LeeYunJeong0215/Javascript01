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

* 이벤트

  1. HTML element 찾기

     * document.getElementById('id')
     * document.getElementByClassName('class')
     * document.getElementByTagName('tag')
     * document.getElementById('id')

     ​

     ​

  2. Event Listener 설정하기

  3. Event Handler 선언하기

