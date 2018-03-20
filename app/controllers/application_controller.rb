class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, :except => [:index]
 
   
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit  :email, :password,
        :password_confirmation, :hospital_account
    end
   end
 
   
  def user_signed_in
    return if current_user
    flash[:danger] = "Signed in first."
    # redirect_to root_url
  end
  
end