class SessionController < ApplicationController
  def new
    if cookies[:my_name]
      redirect_to backend_articles_path
    end
  end

  def create
    @user =  User.find_by_nickname(params[:session][:nickname])
    if @user
       cookies[:my_name] = "AAAA"
    end
    redirect_to backend_articles_path
  end

  def destroy
  end


end
