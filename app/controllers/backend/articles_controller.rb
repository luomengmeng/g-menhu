class Backend::ArticlesController < Backend::BaseController
def index
    @title = '文章列表'
    @articles = Article.order("created_at desc").all.paginate(page:params[:page],per_page:8) 
end

def new
    @title = '添加文章'
    @articles = Article.new
end

def create
    @articles = Article.new(articles_params)
    if @articles.save
      flash[:success] = '添加成功'
      redirect_to backend_articles_path
    else
      flash[:errors] = @articles.errors
      render :new
    end
end

def edit
    @article = Article.find(params[:id])
end

def update
    article = Article.find(params[:id])
    respond_to do |format|
      if article.update_attributes(articles_params)
        format.html { redirect_to backend_articles_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: article.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to backend_articles_path
end 

private
    def articles_params
      params.require(:article).permit(:title,:abstact, :content,:status,:home, :category_id)
    end
end