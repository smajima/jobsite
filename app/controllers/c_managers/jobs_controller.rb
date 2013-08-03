class CManagers::JobsController < ApplicationController
  before_filter :authenticate_c_manager!

  layout 'c_manager'

  def index
    @jobs = current_c_manager.company.jobs
  end

  def show
    @title = "Job Detail"
    @job = Job.find(params[:id])
    @c_manager = current_c_manager
    render :layout => 'plain'
  end
end
