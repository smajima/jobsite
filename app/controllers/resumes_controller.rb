class ResumesController < ApplicationController
  
  before_filter :authenticate_user!

  layout "user"

  def entry
    if current_user.profile.nil?
      flash[:alert] = "create profile first"
      redirect_to entry_profile_path and return
    end
    if current_user.resume.nil?
      current_user.resume = Resume.new
      current_user.save!
    end
    @resume = current_user.resume
    @job_histories = @resume.job_histories
    if @job_histories.blank?
      @job_histories = [TempJobHistory.new]
      render "new" 
    else
      render "show"
    end
  end

  def new
  end

  def show
  end

  def edit
    @job_histories = current_user.resume.job_histories
  end

  def update
    job_histories_create
    p "@job_histories:#{@job_histories}"
    job_histories_error_check
    p "@job_history_error_flag:#{@job_history_error_flag}"
    render "edit" and return if @job_history_error_flag
    current_user.resume.job_histories.delete_all
    @job_histories.each do |j|
      job = JobHistory.new
      job.set_by_temp(j)
      current_user.resume.job_histories << job
    end
    current_user.save!
    redirect_to entry_resume_path    
  end

  def create
    job_histories_create
    job_histories_error_check
    render "new" and return if @job_history_error_flag    
    @job_histories.each do |j|
      job = JobHistory.new
      job.set_by_temp(j)
      current_user.resume.job_histories << job
    end
    current_user.save!
    redirect_to entry_resume_path
  end

  def job_frame
    @number = params[:number]
  end

  private 

  def job_histories_create
    jobs = num_jobs(params)
    @job_histories = []
    1.upto(jobs) do |i|
      @job_histories << create_temp_jobhistory(params["job#{i}"])
    end
    begin
      @job_histories = @job_histories.sort
    rescue
    end
    @job_histories.each_with_index do |job_history, index|
      @job_histories[index].number = index + 1
    end
  end

  def job_histories_error_check
    @job_history_error_flag = false
    @job_histories.each do |job_history|
      unless job_history.valid?
        @job_history_error_flag = true
      end
    end    
  end

  def num_jobs(params)
    jobkeys = params.keys.delete_if{|key| !(key =~ /job./)}
    jobkeys.length
  end

  def create_temp_jobhistory(j_params)
    job_fistory = TempJobHistory.new(j_params)
  end
end