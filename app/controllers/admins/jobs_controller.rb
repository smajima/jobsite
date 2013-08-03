class Admins::JobsController < ApplicationController
  before_filter :authenticate_admin!

  layout 'admin'

  def index
    @company = Company.find(params[:company_id])
    @jobs = Job.where(:company_id => params[:company_id].to_i)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    unless @job.valid?
      render "new"
    else
      company = Company.find(params[:company_id])
      company.jobs << @job
      company.save
      redirect_to admins_company_jobs_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    unless @job.update_attributes(params[:job])
      render "edit"
    else
      redirect_to admins_company_jobs_path
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def search
    set_search_condition(params[:search])
    render 'index'
  end

  S_PARAMS = %w(id title company)
  private
  def set_search_condition(s_params)
    S_PARAMS.each do |param|
      eval "@#{param} = s_params[:#{param}]"
    end
  end  
end
