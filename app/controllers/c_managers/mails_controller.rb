class CManagers::MailsController < ApplicationController
  before_filter :authenticate_c_manager!

  def new_from_company
    @user = User.find(params[:user_id])
    @apply = Apply.find(params[:apply_id])
    @mail = Mail.new
  end

  def lists
    @apply = Apply.find(params[:apply_id])
    @job = @apply.job
    @user = @apply.user
    @mails = @apply.mails
  end

  def check
    @title = params[:title]
    @text = params[:text]
  end

  def show
    @mail = Mail.find(params[:id])
    if @mail.new_mail? && @mail.from_user?
      @mail.status = Mail::READ
      @mail.save
    end
  end

  def reply
    @mail = Mail.new
    base_mail = Mail.find(params[:mail_id])
    @apply = Apply.find(params[:apply_id])
    @user = User.find(params[:user_id])
    @mail.apply_id = @apply.id
    @mail.direction = Mail::FROM_USER
    @mail.status = Mail::UNREAD
    @mail.title = "RE:#{base_mail.title}"
    @mail.text = "------ wrote ------\r\n#{base_mail.text}"
    render "new_from_company"
  end

  def create
    @user = User.find(params[:user_id])
    @apply = Apply.find(params[:apply_id])
    @mail = Mail.create(params[:mail])
    unless @mail.valid?
      render "new_from_company" and return
    end
    @apply.mails << @mail
    @apply.save
    redirect_to({:controller => :mails, :action => :lists, :apply_id => @apply.id})
  end
end
