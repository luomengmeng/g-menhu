class Backend::NavigationsController < Backend::BaseController
def index
    @title = '平台列表'
    @navigations = Navigation.order("created_at desc").all.paginate(page:params[:page],per_page:8) 
end

def show
    @title = '平台列表'
    @navigations = Navigation.where("province_id = ?", params[:id]).order("created_at desc").all.paginate(page:params[:page],per_page:8) 
end

def new
    @title = '添加文章'
    @navigations = Navigation.new
end

def create
    @navigations = Navigation.new(navigation_params)
    if @navigations.save
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
      params.require(:navigation).permit(:with_income, :title, :name, :abstract, :online_time, :name_url, :province_id, :area, :registered_capital, :average_income, :investment_period, :auto_bidding, :creditor, :trust_funds, :tender_guarantee, :security_mode, :guarantee_agency, :management_fee, :prepaid_fee, :withdrawal_fee, :transfer_fee, :method_payment, :vip_fee, :address, :free_phone, :phone, :fax, :mail)
    end

end