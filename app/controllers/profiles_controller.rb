class ProfilesController < ApplicationController

  before_filter :authenticate_user!

  layout 'user'

  def entry
    if current_user.profile.nil?
      @profile = Profile.new
      render 'new'
    else
      @profile = current_user.profile
      render "show"
    end
  end

  def edit
    @profile = current_user.profile
  end

  def show
    @profile = current_usr.profile
  end

  def create
    @profile = Profile.new(params[:profile])
    if @profile.valid?
      current_user.profile = @profile
      current_user.profile.save!
      render "show" and return
    else
      render "new"
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      render "show" and return
    else
      render "edit"
    end
  end

end
