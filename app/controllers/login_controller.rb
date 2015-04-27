class LoginController < ApplicationController

  def login
    unless request.get?
        username = params[:user][:nickname]
        password = params[:user][:password]
        @hint = "ok"
        @user = User.find_by_name(username)
        if @user.class == NilClass
          @hint = 'Unregisted Username!'
        elsif @user.password == params[:user][:password]
          @hint = "Welcome back, "
          redirect_to :controller => 'login', :action => 'index'
        else
          @hint = "Login failed, please check up you info"
        end        
    end
  end
 
 def index

 end
 
end