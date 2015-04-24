class Backend::CategoriesController < Backend::BaseController
def index
    @title = '类别列表'
    @categorys = Category.order("created_at desc").all
end

def new
    @title = '添加类别'
    @categorys = Category.new
end

def create
    @categorys = Category.new(category_params)
    if @categorys.save
      flash[:success] = '添加成功'
      redirect_to backend_categories_path
    else
      flash[:errors] = @category.errors
      render :new
    end
end

def edit
    @category = Category.find(params[:id])
end

def update
    category = Category.find(params[:id])
    respond_to do |format|
      if category.update_attributes(category_params)
        format.html { redirect_to backend_categories_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: category.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to backend_categories_path
end 

private
    def category_params
      params.require(:category).permit(:name)
    end
end