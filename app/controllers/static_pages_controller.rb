class StaticPagesController < ApplicationController
  def home
    if !user_signed_in?
    
      new_user_session_path
    end

  end

end
