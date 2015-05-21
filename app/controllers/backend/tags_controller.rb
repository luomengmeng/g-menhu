class Backend::TagsController < Backend::BaseController
def index
    @title = '类别列表'
    @tags = Tag.order("created_at desc").all.paginate(page:params[:page],per_page:10)
end

def new
    @title = '添加类别'
    @tags = Tag.new
end

def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = '添加成功'
      redirect_to backend_tags_path
    else
      flash[:errors] = @tag.errors
      render :new
    end
end

def edit
    @tag = Tag.find(params[:id])
end

def update
    tag = Tag.find(params[:id])
    respond_to do |format|
      if tag.update_attributes(tag_params)
        format.html { redirect_to backend_tags_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: tags.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to backend_tags_path
end 

private
    def tag_params
      params.require(:tag).permit(:name)
    end
end