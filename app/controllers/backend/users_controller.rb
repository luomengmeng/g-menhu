class Backend::UsersController < Backend::BaseController
def index
    @title = '用户列表'
    @users = User.order("created_at desc").all.paginate(page:params[:page],per_page:10)
end

def new
    @users = User.new
end

def create
    @users = User.new(users_params)
    if @users.save
      flash[:success] = '添加成功'
      redirect_to backend_users_path
    else
      flash[:errors] = @users.errors
      render :new
    end
end

def edit
    @users = User.find(params[:id])
end

def update
    users = User.find(params[:id])
    respond_to do |format|
      if users.update_attributes(users_params)
        format.html { redirect_to backend_users_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: users.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    users = User.find(params[:id])
    users.destroy
    redirect_to backend_users_path
end 

private
    def users_params
      params.require(:user).permit(:nickname, :name, :status, :account_type, :password)
    end
end