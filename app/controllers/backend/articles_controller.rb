class Backend::ArticlesController < Backend::BaseController
def index
    @title = '文章列表'
    @articles = Article.order("created_at desc").all.paginate(page:params[:page],per_page:8) 
end

def show
    @title = '文章列表'
    #@articles = Article.joins(:articles_tags, :tags).select("articles.*,tags.name").where("tags.id = ?",params['id']).order("created_at desc").paginate(page:params[:page],per_page:8) 
    # @articles  = Article.includes(:tags).order("created_at desc").paginate(page:params[:page],per_page:8) 
    @articles  = Article.joins(:tags).where("tags.id = ?",params['id']).order("created_at desc").paginate(page:params[:page],per_page:8) 
    @tags_name = Tag.find(params['id'])
end

def new
    @title = '添加文章'
    @article = Article.new
end

def create
    @article = Article.new(articles_params)
    select = params['select']
    if @article.save
      if select
        select.each do |se|
          tag = Tag.find se
          @article.tags << tag
          @article.save
        end 
      end
      flash[:success] = '添加成功'
      redirect_to backend_articles_path
    else
      flash[:errors] = @article.errors
      render :new
    end
end

def edit
    @article = Article.find(params[:id])
end

def update
    @article = Article.find(params[:id])
    select = params['select']
    article_id = params['id']
    respond_to do |format|
      if @article.update_attributes(articles_params)
        ArticlesTag.where("article_id = ? " , article_id).find_each do |at|
          ats = ArticlesTag.find_by(tag_id: at.tag_id)
          if ats
            ats.destroy
          end
        end

        articles = ArticlesTag.find_by(article_id: article_id)
        if articles
          articles.destroy
        end
        if select
          select.each do |se|
            tag = Tag.find se
            @article.tags << tag
            @article.save
          end 
        end
        
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