class CManagers::CompaniesController < ApplicationController
  before_filter :authenticate_c_manager!

  layout 'c_manager'
  
  def show
    @company = current_c_manager.company
  end
end
