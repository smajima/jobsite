class JobHistoryValidator < ActiveModel::Validator
  def validate(record)
    if record.start_month.nil?
      record.errors[:start_month] << "Specify Start Month"
    end
    if record.number != 1 && record.end_month.nil?
      record.errors[:end_month] << "Specify End Month"
    end
    if record.company_name.blank?
      record.errors[:company_name] << "Specify Company Name"
    end
    if record.company_name && record.company_name.length > 40
      record.errors[:company_name] << "Company name is too long"
    end
    if record.detail.blank?
      record.errors[:detail] << "Detail should not blank"
    end
  end
end
