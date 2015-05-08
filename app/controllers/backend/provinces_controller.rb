class Backend::ProvincesController < Backend::BaseController
def index
    @title = '省份列表'
    @provinces = Province.order("created_at desc").all.paginate(page:params[:page],per_page:10)
end

def new
    @title = '省份类别'
    @provinces = Province.new
end

def create
    @provinces = Province.new(province_params)
    if @provinces.save
      flash[:success] = '添加成功'
      redirect_to backend_provinces_path
    else
      flash[:errors] = @provinces.errors
      render :new
    end
end

def edit
    @province = Province.find(params[:id])
end

def update
    province = Province.find(params[:id])
    respond_to do |format|
      if province.update_attributes(province_params)
        format.html { redirect_to backend_provinces_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: provinces.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    category = Province.find(params[:id])
    category.destroy
    redirect_to backend_provinces_path
end 

private
    def province_params
      params.require(:province).permit(:name)
    end
end