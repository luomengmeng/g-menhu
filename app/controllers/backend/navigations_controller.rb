class Backend::NavigationsController < Backend::BaseController
def index
    @title = '平台列表'
    @navigation = Navigation.order("created_at desc").all.paginate(page:params[:page],per_page:10) 
end

def show
    @title = '平台列表'
    params_id = params[:id]
    params_state = params[:state]
    if params_state == 'province'
      @navigations = Navigation.where("province_id = ?", params_id).order("created_at desc").all.paginate(page:params[:page],per_page:10) 
    elsif params_state == 'investigate'
      @navigations = Navigation.where("investigate_id = ?", params_id).order("created_at desc").all.paginate(page:params[:page],per_page:10) 
    elsif params_state == 'line'
      @navigations = Navigation.where("line_id = ?", params_id).order("created_at desc").all.paginate(page:params[:page],per_page:10) 
    else
      @navigations = Navigation.where("problem_id = ?", params_id).order("created_at desc").all.paginate(page:params[:page],per_page:10) 
    end
end

def new
    @title = '添加文章'
    @navigation = Navigation.new
end

def create
    @navigation = Navigation.new(navigation_params)
    if @navigation.save
      flash[:success] = '添加成功'
      redirect_to backend_navigations_path
    else
      flash[:errors] = @navigations.errors
      render :new
    end
end

def edit
    @navigation = Navigation.find(params[:id])
end

def update
  # binding.pry
    navigation = Navigation.find(params[:id])
    respond_to do |format|
      if navigation.update_attributes(navigation_params)
        format.html { redirect_to backend_navigations_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: navigations.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    navigations = Navigation.find(params[:id])
    navigations.destroy
    redirect_to backend_navigations_path
end 

private
    def navigation_params
      params.require(:navigation).permit(:logo, :hot, :investigate_id, :line_id, :problem_id, :with_income, :title, :name, :abstract, :online_time, :name_url, :province_id, :area, :registered_capital, :average_income, :investment_period, :auto_bidding, :creditor, :trust_funds, :tender_guarantee, :security_mode, :guarantee_agency, :management_fee, :prepaid_fee, :withdrawal_fee, :transfer_fee, :method_payment, :vip_fee, :address, :free_phone, :phone, :fax, :mail)
    end

end