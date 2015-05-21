class Backend::AbroadsController < Backend::BaseController
def index
    @title = '类别列表'
    @abroads = Abroad.order("created_at desc").all.paginate(page:params[:page],per_page:10)
end

def new
    @title = '添加类别'
    @abroads = Abroad.new
end

def create
    @abroads = Abroad.new(abroad_params)
    if @abroads.save
      flash[:success] = '添加成功'
      redirect_to backend_abroads_path
    else
      flash[:errors] = @abroads.errors
      render :new
    end
end

def edit
    @abroad = Abroad.find(params[:id])
end

def update
    abroad = Abroad.find(params[:id])
    respond_to do |format|
      if abroad.update_attributes(abroad_params)
        format.html { redirect_to backend_abroads_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: abroad.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    abroad = Abroad.find(params[:id])
    abroad.destroy
    redirect_to backend_abroads_path
end 

private
    def abroad_params
      params.require(:abroad).permit(:name, :url)
    end
end