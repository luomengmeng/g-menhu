class Backend::LinesController < Backend::BaseController
def index
    @title = '类别列表'
    @lines = Line.order("created_at desc").all.paginate(page:params[:page],per_page:10)
end

def new
    @title = '添加类别'
    @lines = Line.new
end

def create
    @lines = Line.new(line_params)
    if @lines.save
      flash[:success] = '添加成功'
      redirect_to backend_lines_path
    else
      flash[:errors] = @lines.errors
      render :new
    end
end

def edit
    @line = Line.find(params[:id])
end

def update
    line = Line.find(params[:id])
    respond_to do |format|
      if line.update_attributes(line_params)
        format.html { redirect_to backend_lines_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: line.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    line = Line.find(params[:id])
    line.destroy
    redirect_to backend_lines_path
end 

private
    def line_params
      params.require(:line).permit(:name)
    end
end