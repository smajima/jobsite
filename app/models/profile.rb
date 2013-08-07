class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :first_name, :kana_first_name, :kana_last_name, :last_name, :birthday
  attr_accessible :zip, :pref_code, :address0, :address1, :address2, :phone, :cell_phone
  validates :first_name, :presence => true, :length => {:maximum => 32}
  validates :last_name, :presence => true, :length => {:maximum => 32}
  validates :zip, :presence => true, :length => {:maximum => 7}
  validates :address0, :presence => true, :length => {:maximum => 255}
  validates :address1, :presence => true, :length => {:maximum => 255}
  validates :address2, :allow_blank => true, :length => {:maximum => 255}
end
