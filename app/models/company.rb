class Company < ActiveRecord::Base
  attr_accessible :name, :address, :capital, :ceo, :employee_number, :established_date, :url, :works, :one_word, :summary
  has_many :jobs
  has_one :c_manager

  validates :name, :presence => true, :length => {:maximum => 255}
  validates :address, :presence => true, :length => {:maximum => 255}
  validates :capital, :presence => true, :numericality => {:greater_than => 1, :only_integer => true}
  validates :ceo, :presence => true, :length => {:maximum => 255}
  validates :employee_number, :presence => true
  validates :established_date, :presence => true
  validates :url, :length => {:maximum => 255}, :format => {:with => URI.regexp('http')}
  validates :works, :presence => true
  validates :one_word, :presence => true
  validates :summary, :presence => true
end
