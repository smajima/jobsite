class AppliesController < ApplicationController
  before_filter :authenticate_user!

  layout 'user'
  
  def index
    user = current_user
    @applies = user.applies
  end
end
