class Apply < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  attr_accessible :result
  has_many :mails
  
  # attr_accessible :title, :body
end
