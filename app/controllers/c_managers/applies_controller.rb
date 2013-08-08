class CManagers::AppliesController < ApplicationController

  layout 'plain'

  def show
    @apply = Apply.find(params[:id])
  end

end
