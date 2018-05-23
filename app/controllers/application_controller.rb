class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  # before_filter :authenticate_user! || :authenticate_patient!
  # before_filter :set_current_hospital


  before_filter :set_start_time

  

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_url }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
   
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit  :email, :password,
        :password_confirmation, :hospital_account
    end
   end
   
  # def set_current_hospital
  #     Mongoid::Multitenancy.current_tenant = current_user.hospital
  # end
  
  def set_start_time
    @start_time = Time.now.to_f
  end
  def user_signed_in
    return if current_user 
    flash[:danger] = "Signed in first."
    # redirect_to root_url
  end
  def patient_signed_in
    return if current_patient 
    flash[:danger] = "Signed in first."
    # redirect_to root_url
  end
#   def current_tenant
#       current_tenant = current_user.
#   end
  def current_ability
    if patient_signed_in?
      @current_ability ||= Ability.new(current_patient)
    else
      @current_ability ||= Ability.new(current_user)
    end
  end
end
