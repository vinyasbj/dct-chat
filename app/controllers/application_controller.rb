class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   before_action :configure_permitted_parameters, if: :devise_controller?

  
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :configure_permitted_parametes, if: :devise_controller?
  protect_from_forgery with: :exception
  def check_is_admin
    if current_user.is_admin
      return true
    else
      redirect_to channels_path , notice: "page dose not exist"
    end
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name ])
  end
end
