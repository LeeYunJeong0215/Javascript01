class SessionsController < ApplicationController

  def signin
  end

  def user_signin
    #user를 불러오고
    user = User.find_by(email: params[:email])
    #유저가 있으면서(user &&) 인증을 할 수 있느냐(user.authenticate(params[:password])
    if user && user.authenticate(params[:password]) #맞으면 true, 틀리면 false 리턴
      session[:user_id] = user.id
      # flash[:notice] = "로그인에 성공하셨습니다"
      redirect_to '/', notice: "로그인에 성공하셨습니다"

    else #유저가 없거나 비밀번호가 맞지 않을때
      # flash[:notice] = "등록되지 않은 이메일 이거나 비밀번호가 틀렸습니다." =>플래시 메시지 띄우는방법 1
      redirect_to '/signin', notice: "등록되지 않은 이메일 이거나 비밀번호가 틀렸습니다" #-> 플래시 메시지 띄우는 방법 2
    end
  end

  def signup
  end

  def user_signup
    User.create(
      email: params[:email],
      # Use ActiveModel has_secure_password
      # gem 'bcrypt' 덕분에 가능
      password: params[:password],
      password_confirmation: params[:apssword_confirmation]
    )
    redirect_to '/signin'
  end

  def signout
    session.delete(:user_id)
    redirect_to '/', notice: "로그아웃 하셨습니다"
  end

end
