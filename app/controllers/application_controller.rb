class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper_method : view파일에서도 메소드 호출이 가능
  helper_method :current_user, :user_signed_in?
  def current_user
    #현재 로그인한 유저의 정보를 리턴
    unless session[:user_id].nil? #session에 정보가 비어있지 않다면(로그인 한 경우)
      @current_user = User.find(session[:user_id])
  end
  @current_user #로그인 되어있지 않으면 nil값 리턴
end

  def user_signed_in? #메소드 명이 ?로 끝날 경우 리턴 값이 boolean 타입
    !session[:user_id].nil? #-> session이 비어있지 않으면(즉 로그인하면)
    #로그인 한 경우 true, 아닐 경우 false
  end

  def authenticate_user! #메소드 명이 !(bang)로 끝날 경우 주의해야 할 메소드이다.
    #유저가 로그인하지 않은 경우에 로그인페이지로 이동
    if session[:user_id].nil?
      redirect_to '/signin', notice: "로그인이 필요합니다."
    end
  end
end
