class Admins::CManagersController < ApplicationController
  before_filter :authenticate_admin!

  layout 'admin'

  def new
    @company = Company.find(params[:company_id])
    @c_manager = CManager.new
  end

  def create
    @c_manager = CManager.new(params[:c_manager])
    @company = Company.find(params[:company_id])
    unless @c_manager.valid?
      render "new"
    else
      @company.c_manager = @c_manager
      @company.save
      redirect_to admins_company_c_manager_path
    end 
  end

  def edit
    @company = Company.find(params[:company_id])
    @c_manager = @company.c_manager
  end

  def update
    @company = Company.find(params[:company_id])
    @c_manager = @company.c_manager
    unless @c_manager.update_attributes(params[:c_manager])
      render "edit"
    else
      redirect_to admins_company_c_manager_path 
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @c_manager = @company.c_manager
    redirect_to new_admins_company_c_manager_path if @c_manager.nil?
  end

end
