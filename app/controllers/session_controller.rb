class SessionController < ApplicationController

  def create
    nickname = params[:session][:nickname]
    password = params[:session][:password]
    remember = params[:remember]
    User.where("nickname = ? and password = ? and status = ? and account_type = ?", nickname , password , "1" , "2").find_each do |userinfo|
      if userinfo.nickname == nickname
        if remember == 'Remember'
          cookies[:user_name] = {:value => 'menhu' , :expires => 1.weeks.from_now.utc}
        else
          cookies[:user_name] = 'menhu'
        end
      end
    end
    if cookies[:user_name] == 'menhu'
      redirect_to backend_users_path
    else
      render template: "session/new"
    end
  end

  def destroy
    cookies[:user_name] = {:expires => 2.weeks.ago.utc}
    redirect_to login_path
  end

  def new
    if cookies[:user_name] == 'menhu'
      redirect_to backend_articles_path
    end
  end

end
