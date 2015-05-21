class Backend::TitlesController < Backend::BaseController
def index
    @title = '类别列表'
    @titles = Title.order("created_at desc").all.paginate(page:params[:page],per_page:10)
end

def new
    @title = '添加类别'
    @titles = Title.new
end

def create
    @titles = Title.new(title_params)
    if @titles.save
      flash[:success] = '添加成功'
      redirect_to backend_titles_path
    else
      flash[:errors] = @titles.errors
      render :new
    end
end

def edit
    @title = Title.find(params[:id])
end

def update
    title = Title.find(params[:id])
    respond_to do |format|
      if title.update_attributes(title_params)
        format.html { redirect_to backend_titles_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: title.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    title = Title.find(params[:id])
    title.destroy
    redirect_to backend_titles_path
end 

private
    def title_params
      params.require(:title).permit(:name, :name_url, :status)
    end
end
# 新浪科技| 腾讯科技| 网易科技| 凤凰科技| 派代网| 人民网通信| 站长之家| 199it-互联网研究| 盐科技| 雷科技| 亿欧网