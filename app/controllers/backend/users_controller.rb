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

 def caiji
    #gem install nokogiri
    #http://51itbk.sinaapp.com/14_02_2012/177.html
    require 'nokogiri'  
    require 'open-uri' 
    # html = 'http://www.baidu.com'
    # @doc = Nokogiri::HTML(open(html))
    # @doc.css('a').each do |link|
    #    puts "#{link.content},fg, #{link['href']}"
    # end  
    weather = Nokogiri::HTML(open('http://www.weather.com.cn/'))
    weather.search("//ul[@class='on']").each do |li|
        place1 = li.search("span[1]").text
        place2 = li.search("span[2]").text
        place3 = li.search("span[3]").text
        place4 = li.search("span[4]").text
        puts "place1 , place1 , place1, place1"
        puts "------------------------------"  
        puts "#{place1} , #{place2} , #{place3} , #{place4} , \n \r"
    end
 end


private
    def users_params
      params.require(:user).permit(:nickname, :name, :status, :account_type, :password)
    end
end