class CManagers::SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication, :only => [:new, :create]

  layout 'c_manager'

end