class Backend::InvestigatesController < Backend::BaseController
def index
    @title = '类别列表'
    @investigates = Investigate.order("created_at desc").all.paginate(page:params[:page],per_page:10)
end

def new
    @title = '添加类别'
    @investigates = Investigate.new
end

def create
    @investigates = Investigate.new(investigate_params)
    if @investigates.save
      flash[:success] = '添加成功'
      redirect_to backend_investigates_path
    else
      flash[:errors] = @investigates.errors
      render :new
    end
end

def edit
    @investigate = Investigate.find(params[:id])
end

def update
    investigate = Investigate.find(params[:id])
    respond_to do |format|
      if investigate.update_attributes(investigate_params)
        format.html { redirect_to backend_investigates_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: investigate.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    investigate = Investigate.find(params[:id])
    investigate.destroy
    redirect_to backend_investigates_path
end 

private
    def investigate_params
      params.require(:investigate).permit(:name)
    end
end