class Frontend::ArticlesController < ApplicationController
  def index
    article_id = params[:id]
    @title = '文章列表'
    @articles = Article.order("created_at desc").all.paginate(page:params[:page],per_page:5) 
  end
  
  def show
    params_id = params[:id]
    params_state = params[:state]
    if params_state == 'category'
      @articles_list  = Article.joins(:category).where("category_id = ?",params_id).order("created_at desc").paginate(page:params[:page],per_page:5) 
      @name = Category.find(params_id).name
      render "list"
    elsif params_state == "tag"
      @articles_list  = Article.joins(:tags).where("tags.id = ?",params['id']).order("created_at desc").paginate(page:params[:page],per_page:5) 
      @name = Tag.find(params['id']).name
      render "list"
    else
      @article = Article.find(params_id)
      render "show"
    end
  end

end
