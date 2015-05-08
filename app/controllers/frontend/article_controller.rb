class Frontend::ArticleController < ApplicationController
  def index
  end
  
  def list
  end

  def show
    params_id = 43
    article = Article.find_by(id:params_id)
    article.num = 1 + article.num.to_i
    article.save
  end
end
