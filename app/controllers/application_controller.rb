class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected
    
  def after_sign_in_path_for(resource)
    '/hoegi105/mainpage' #your path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    '/login'
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :student_num, :user_major) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :student_num, :user_major) }
  end
end
