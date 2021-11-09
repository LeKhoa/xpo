class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout :layout_by_resource

  protected

  def layout_by_resource
    return 'admin' if devise_controller? && resource_name == :admin_user
    return 'home' if current_user
    'application'
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :layout => false, :status => :not_found }
      format.all { render nothing: true, status: 404 }
    end
  end
end
