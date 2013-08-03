class TempJobHistory
  include Comparable
  include ActiveModel::Validations
  attr_accessor :company_name, :number, :detail, :end_month, :hiring_type, :start_month
  validates_with JobHistoryValidator

  def initialize(j_params = nil)
    unless j_params
      @company_name = @hiring_type = @start_month = @end_month = nil
      @number = 1
      @detail = ''
    else
      @company_name = j_params[:company_name]
      @number = j_params[:number].to_i
      @detail = j_params[:detail]
      @hiring_type = j_params[:hiring_type]
      if j_params[:s_date][:year].presence && j_params[:s_date][:month].presence
        @start_month = Date.new(j_params[:s_date][:year].to_i, j_params[:s_date][:month].to_i, 1)
      else
        @start_month = nil
      end
      if j_params[:e_date][:year].presence && j_params[:e_date][:month].presence
        @end_month = Date.new(j_params[:e_date][:year].to_i, j_params[:e_date][:month].to_i, 1)
      else
        @end_month = nil
      end 
    end   
  end

  def <=> (other)
    p "self:#{self.inspect}"
    p "other:#{other.inspect}"
    if !@start_month.nil? && !other.start_month.nil?
      -1 if @start_month > other.start_month
      0 if @start_month == other.start_month
      1 if @start_month < other.start_month
    elsif !@number.nil? && !other.number.nil?
      @number <=> other.number
    end
  end
end



