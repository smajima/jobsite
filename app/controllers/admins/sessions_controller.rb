class Admins::SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication, :only => [:new, :create]

  def new
    redirect_to top_admins_top_path and return if admin_signed_in?
  	render :layout => 'admin'
  end

end
