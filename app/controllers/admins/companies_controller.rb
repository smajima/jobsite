class Admins::CompaniesController < ApplicationController
  before_filter :authenticate_admin!

  layout 'admin'

  def index
    @companies = Company.all
  end

  def search
    set_search_condition(params[:search])
    render 'index'
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    unless @company.save
      render "new"
    else
      redirect_to admins_companies_path
    end 
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    unless @company.update_attributes(params[:company])
      render "edit"
    else
      redirect_to admins_companies_path 
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  S_PARAMS = %w(company_name)
  private
  def set_search_condition(s_params)
    S_PARAMS.each do |param|
      eval "@#{param} = s_params[:#{param}]"
    end
  end
end
