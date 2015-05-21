class Frontend::NewsController < ApplicationController


  def show
    category_id = params[:id]
    @title = '文章列表'
    @articles_list  = Article.joins(:category).where("category_id = ?",category_id).order("created_at desc").paginate(page:params[:page],per_page:5) 
    @tag_name = Category.find(category_id)
  end



end
