class JobsController < ApplicationController

  layout 'user'
  
  def top
  	@new_jobs = Job.recent
    @categorized_number = Job.categorized_number
    @recent_see_jobs = recent_see_jobs
    Rails.logger.error "recet_see_jobs:#{@recent_see_jobs.inspect}"
  end

  def show
    if user_signed_in?
      @user_id = current_user.id
    else
      @user_id = nil
    end
    add_recent_see(params[:id])
    @job = Job.find(params[:id])
  end

  def list
    @jobs = Job.category(params[:id])
  end

  def before_apply
    @job = Job.find(params[:id])
    @user = User.find(params[:user_id])
    unless @user.has_profile?
      flash.now[:error] = "You have to create profile in my page"
      render and return
    end
    unless @user.has_job_history?
      flash.now[:error] = "You have to resiter your job history"
      render and return
    end
    unless @user.can_apply?(@job)
      flash.now[:error] = "You already applied this job"
    end 
  end

  def apply
    @job = Job.find(params[:id])
    @user = User.find(params[:user_id])
    @user.jobs << @job
    @user.save  
  end
end
