class PagesController < ApplicationController
  def home
  	if user_signed_in?
  		#@projects = 
  		end
  end

 #@activities = PublicActivity::Activity.order("created_at DESC").where(owner_id: current_user, owner_type: "User")
end
