class Backend::ProblemsController < Backend::BaseController
def index
    @title = '类别列表'
    @problems = Problem.order("created_at desc").all.paginate(page:params[:page],per_page:10)
end

def new
    @title = '添加类别'
    @problems = Problem.new
end

def create
    @problems = Problem.new(problem_params)
    if @problems.save
      flash[:success] = '添加成功'
      redirect_to backend_problems_path
    else
      flash[:errors] = @problems.errors
      render :new
    end
end

def edit
    @problem = Problem.find(params[:id])
end

def update
    problem = Problem.find(params[:id])
    respond_to do |format|
      if problem.update_attributes(problem_params)
        format.html { redirect_to backend_problems_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: problem.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    problem = Problem.find(params[:id])
    problem.destroy
    redirect_to backend_problems_path
end 

private
    def problem_params
      params.require(:problem).permit(:name)
    end
end