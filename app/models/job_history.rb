class JobHistory < ActiveRecord::Base
  attr_accessible :company_name, :number, :detail, :end_month, :hiring_type, :start_month
  scope :by_history,  order("start_month asc")

  WORK_TYPE = {'parmanent' => 'parmanent', 'contract' => 'contract', 'temporary' => 'temporary', 'else' => 'else'}

  def set_by_temp(temp)
    self.company_name = temp.company_name
    self.number = temp.number
    self.start_month = temp.start_month
    self.end_month = temp.end_month
    self.hiring_type = temp.hiring_type
    self.detail = temp.detail
  end
end
