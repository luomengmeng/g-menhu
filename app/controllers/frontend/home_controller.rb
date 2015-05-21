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


    
    @wangdai_d = Article.where("updated_at >= ? and status = ? and home = ? " , (Time.now - 24.hours),"1","true").order(num: :desc).limit(4)
    if @wangdai_d == nil
        @wangdai_d = @wangdai_d
    else
        @wangdai_d = Article.where("status = ? and home = ? " ,"1","true").order(num: :desc).limit(4)
    end

    @wangdai_w = Article.where("created_at >= ? and status = ? and home = ? " , (Time.now - 168.hours),"1","true").order(num: :desc).limit(4)
    if @wangdai_w == nil
        @wangdai_w = @wangdai_w
    else
        @wangdai_w = Article.where("status = ? and home = ? " ,"1","true").order(num: :desc).limit(4)
    end

    #tag
    @tags = Tag.order("created_at desc").all

    #first
    @first = Article.where("category_id = ? and status = ? and home = ?",20 , "1" , "true").order(created_at: :desc)
    @first_pic = @first.limit(5)

    #看网贷
    @kwd = Article.where("category_id = ? and status = ? and home = ?",14 , "1" , "true").order(created_at: :desc)
    @kwd_pic = @kwd.limit(5)
    @kwd_1 = @kwd.limit(3).offset(1)
    @kwd_2 = @kwd.limit(3).offset(4)
    @kwd_3 = @kwd.limit(3).offset(7)
    #网贷视野
    @wdsy = Article.where("category_id = ? and status = ? and home = ?",15 , "1" , "true").order(created_at: :desc)
    @wdsy_pic = @wdsy.limit(5)
    @wdsy_1 = @wdsy.limit(3).offset(1)
    @wdsy_2 = @wdsy.limit(3).offset(4)
    @wdsy_3 = @wdsy.limit(3).offset(7)
    #CEO头条
    @ctop = Article.where("category_id = ? and status = ? and home = ?",16 , "1" , "true").order(created_at: :desc)
    @ctop_pic = @ctop.limit(5)
    @ctop_1 = @ctop.limit(3).offset(1)
    @ctop_2 = @ctop.limit(3).offset(4)
    @ctop_3 = @ctop.limit(3).offset(7)
    #上线早知道
    @zzd = Article.where("category_id = ? and status = ? and home = ?",19 , "1" , "true").order(created_at: :desc)
    @zzd_pic = @zzd.limit(5)
    @zzd_1 = @zzd.limit(3).offset(1)
    @zzd_2 = @zzd.limit(3).offset(4)
    @zzd_3 = @zzd.limit(3).offset(7)
    #平台公告
    @ptgg = Article.where("category_id = ? and status = ? and home = ?",3 , "1" , "true").order(created_at: :desc)
    @ptgg_pic = @ptgg.limit(5)
    @ptgg_1 = @ptgg.limit(3).offset(1)
    @ptgg_2 = @ptgg.limit(3).offset(4)
    @ptgg_3 = @ptgg.limit(3).offset(7)

    @problems = Problem.where("id != ?" , 1).order("created_at desc").all
    @investigates = Investigate.order("created_at desc").all
    @lines = Line.order("created_at desc").all

    #平台活动
    @pthd = Article.where("category_id = ? and status = ? and home = ?",12 , "1" , "true").order(created_at: :desc).limit(4)

    #政策解读
    @zcjd = Article.where("category_id = ? and status = ? and home = ?",2 , "1" , "true").order(created_at: :desc).limit(3)
    @ptyw = Article.where("category_id = ? and status = ? and home = ?",3 , "1" , "true").order(created_at: :desc).limit(3)
    @sjfx = Article.where("category_id = ? and status = ? and home = ?",4 , "1" , "true").order(created_at: :desc).limit(3)
    @lcgl = Article.where("category_id = ? and status = ? and home = ?",5 , "1" , "true").order(created_at: :desc).limit(3)
    

  end
end
