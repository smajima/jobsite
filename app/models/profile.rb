class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :first_name, :kana_first_name, :kana_last_name, :last_name, :birthday
  validates :first_name, :presence => true, :length => {:maximum => 32}
  validates :last_name, :presence => true, :length => {:maximum => 32}
end
