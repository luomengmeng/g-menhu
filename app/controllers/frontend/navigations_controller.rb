class Frontend::NavigationsController < ApplicationController

  def index
    params_id = params[:id]
    params_state = params[:state]
    @title = '平台列表'
    @investigates = Investigate.order("created_at desc").all
    @lines = Line.order("created_at desc").all
    @provinces = Province.order("created_at asc").all
    @navigations = Navigation.order("created_at desc").all
    @abroads = Abroad.order("created_at desc").all
    @stations = Station.order("created_at desc").all
    @problems = Problem.where("id != ?" , 1).order("created_at desc")
    @prolem_provinces = Province.joins(:navigation).where("navigations.problem_id != ? " , 1).order("created_at desc").group("provinces.id")
    @pthd = Article.where("category_id = ? and status = ? and home = ?",12 , "1" , "true").order(created_at: :desc).limit(5)
    @rdpt = Navigation.where("hot = ?" , "1").order(created_at: :desc)
  end
  
  def show
    #binding.pry
    params_state = params[:state]
    pt_id = params[:id]
    @pt = Navigation.where("id = ?", pt_id).order("created_at desc")
  end

  def ajax
    params_id = params[:id]
    params_state = params[:state]
      if params_state== "investigates"
        data = Navigation.includes(:province).where("investigate_id = ?", params_id).order("navigations.created_at desc")
        @navigations = data.group_by{|nav| nav.province.name}
      elsif params_state== "lines"
        data = Navigation.includes(:line).where("online_time = ?", params_id).order("navigations.created_at desc")
        @navigations = data.group_by{|nav| nav.province.name}
      elsif params_state== "problems"
        data = Navigation.includes(:province).where("problem_id = ?", params_id).order("navigations.created_at desc")
        @navigations = data.group_by{|nav| nav.province.name}
      end
      render layout: false
  end



end
