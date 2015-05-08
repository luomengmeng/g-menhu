class Frontend::HomeController < ApplicationController
  def index
    @articles_new = Article.where("status = ? and home = ?","1","true").order(created_at: :desc)
    @articles_new1 = @articles_new.limit(3)
    @articles_new2 = @articles_new.limit(3).offset(3)
    @articles_new3 = @articles_new.limit(3).offset(6)
    @articles_new4 = @articles_new.limit(3).offset(9)

    @categories = Category.order(created_at: :desc)
    # @article = Article.where("category_id = ?",).order(created_at: :desc)
    @categories_1 = @categories.limit(3)
    @categories_2 = @categories.limit(7).offset(7)

    @articles_14 = Article.where("category_id = ? and status = ? and home = ?",14 , "1" , "true").order(created_at: :desc)
    @articles_14_2 = @articles_14.limit(3)
    @articles_14_3 = @articles_14.limit(3).offset(3)
    @articles_14_4 = @articles_14.limit(3).offset(6)

    @articles_15 = Article.where("category_id = ? and status = ? and home = ?",15 , "1" , "true").order(created_at: :desc)
    @articles_15_2 = @articles_15.limit(3)
    @articles_15_3 = @articles_15.limit(3).offset(3)
    @articles_15_4 = @articles_15.limit(3).offset(6)

    @articles_16 = Article.where("category_id = ? and status = ? and home = ?",16 , "1" , "true").order(created_at: :desc)
    @articles_16_2 = @articles_16.limit(3)
    @articles_16_3 = @articles_16.limit(3).offset(3)
    @articles_16_4 = @articles_16.limit(3).offset(6)

    @wangdai_d = Article.where("created_at >= ? and status = ? and home = ? " , (Time.now - 24.hours),"1","true").order(num: :desc).limit(4)
    @wangdai_w = Article.where("created_at >= ? and status = ? and home = ? " , Time.now - 168.hours,"1","true").order(num: :desc).limit(4)
  end
end
