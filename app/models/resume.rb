class Resume < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :job_histories, :dependent => :delete_all
end
