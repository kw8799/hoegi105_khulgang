class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected
    
  def after_sign_in_path_for(resource) #your path
    '/main/detector'
  end
  
  def after_sign_out_path_for(resource_or_scope)
    '/main/index'
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :student_num, :user_major) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :student_num, :user_major) }
  end
  
  def require_login
    unless user_signed_in?
      redirect_to "/"
    end
  end

end
