class StaticPagesController < ApplicationController
 skip_before_action :authenticate_user!, :only => [:home]
 skip_before_action :authenticate_patient!, :only => [:home]
  def home
    # if !user_signed_in? && !admin_user_signed_in?
    
    #   new_user_session_path
    # end
    if user_signed_in? && current_user.is_hospital?
        redirect_to current_user.hospital
    end
    if patient_signed_in?
        redirect_to current_patient
    end
  end

end
