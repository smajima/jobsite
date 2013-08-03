class Job < ActiveRecord::Base
  belongs_to :company
  has_many :applies
  has_many :users, :through => :applies

  attr_accessible :background, :compensation, :credentials, :detail, :hiring_type, :holidays, :occupation, :salary, :work_place, :work_time
  attr_accessible :posting_start, :posting_end, :job_id, :title, :job_category

  validates_presence_of :background, :compensation, :credentials, :detail, :hiring_type, :holidays, :occupation, :salary
  validates_presence_of :work_place, :work_time, :posting_start, :posting_end, :title
  validates :job_id, :presence => true, :uniqueness => true

  scope :recent, where("posting_start between ? and ?", Time.now.beginning_of_day - 2.days, Time.now.beginning_of_day)
  scope :posted, where("posting_start < ? and ? < posting_end", Time.now, Time.now)
  scope :category, lambda{|c| where("job_category == ?", c)}

  JOB_CATEGORY = [
    {:id => 1, :name => 'IT'},
    {:id => 2, :name => 'Marketing'},
    {:id => 3, :name => 'Sales'},
  ]

  def self.categorized_number
    cat_num_array = []
    JOB_CATEGORY.each do |cat|
      cat_num_array << {:id => cat[:id], :name => cat[:name], :number => posted.category(cat[:id]).count()}
    end
    cat_num_array
  end  
end
