# encoding=utf-8
class MailsController < ApplicationController
  before_filter :authenticate_user!

  layout 'user'

  def index
    user = current_user
    @applies = user.applies.reverse
  end

  def reply
    @mail = Mail.new
    base_mail = Mail.find(params[:mail_id])
    @apply = Apply.find(params[:apply_id])
    @company_name = @apply.job.company.name
    @mail.apply_id = @apply.id
    @mail.direction = Mail::FROM_USER
    @mail.status = Mail::UNREAD
    @mail.title = "RE:#{base_mail.title}"
    @mail.text = "------ wrote ------\r\n#{base_mail.text}"
  end

  def show
    @mail = Mail.find(params[:id])
    if @mail.new_mail? && @mail.from_company?
      @mail.status = Mail::READ
      @mail.save
    end
  end

  def create
    mail_params = params[:mail]
    apply_id = mail_params.delete(:apply_id) 
    @apply = Apply.find(apply_id)
    @mail = Mail.create(mail_params)
    @copmany_name = @apply.job.company.name
    unless @mail.valid?
      @mail.apply_id = apply_id
      render "reply" and return
    end
    @apply.mails << @mail
    @apply.save
    redirect_to mails_path
  end

  def check
    @title = params[:title]
    @text = params[:text]
  end
end
