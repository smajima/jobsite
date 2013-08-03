class Mail < ActiveRecord::Base
  attr_accessible :title, :text, :direction, :status
  belongs_to :apply
  # attr_accessible :title, :body

  validates :title, :presence => true, :length => {:maximum => 256}
  validates :text, :presence => true
  validates :direction, :presence => true
  validates :status, :presence => true

  FROM_USER = "user"
  FROM_COMPANY = "company"
  UNREAD = "unread"
  READ = "read"

  scope :from_user, where("direction = '#{FROM_USER}'")
  scope :new_status, where("status = '#{UNREAD}'")
  scope :from_company, where("direction = '#{FROM_COMPANY}'")
  scope :specify_apply, lambda{|apply_id| where("apply_id = ?", apply_id)}

  scope :new_from_user, lambda{|apply_id| specify_apply(apply_id).from_user.new_status}
  scope :sent_from_company, lambda{|apply_id| specify_apply(apply_id).from_company} 

  def from_user?
    direction == "#{FROM_USER}"
  end

  def from_company?
    direction == "#{FROM_COMPANY}"
  end

  def new_mail?
    status == "#{UNREAD}"
  end
end
