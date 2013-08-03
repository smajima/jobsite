class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  has_one :resume, :dependent => :destroy
  has_many :applies
  has_many :jobs, :through => :applies
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body


  def has_profile?
    return false if self.profile.nil?
    return true
  end

  def has_job_history?
    return false if self.resume.nil?
    return false if self.resume.job_histories.nil?
    return true
  end

  def can_apply?(job)
    return false if self.jobs.include?(job)
    return true
  end
end
