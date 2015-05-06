class Backend::BaseController < ApplicationController
  before_action :auth?
    layout 'backend'

def init_breadcrumb(options = {})
  drop_breadcrumb params[:controller] , url_for(:controller => params[:controller])
  drop_breadcrumb params[:action] unless params[:action] == 'index'
end

def add_logger
    Rails.logger.add_metadata(user_id: current_user.id) if Rails.logger.respond_to?(:add_metadata)
    Rails.logger.add_metadata(user_email: current_user.email) if Rails.logger.respond_to?(:add_metadata)
end

private
def verify_admin
    redirect_to root_url unless current_user.roles.is_admin.present?
end
  def auth?
    if cookies[:user_name] == "menhu"

    else
        redirect_to  login_path
    end
  end
end
