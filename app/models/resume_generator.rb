class ResumeGenerator
  include ApplicationHelper

  def generate(profile, resume)
    profile = generate_profile(profile)
    job_history = generate_job_histories(resume.job_histories)
    "#{profile}#{job_history}"
  end

  def generate_profile(profile)
    html = "<table>"
    html << create_table_header(["", ""])
    html << create_table_row(["Name", "#{profile.first_name} #{profile.last_name}"])
    html << create_table_row(["Birthday", "#{profile.birthday.strftime('%Y/%m/%d')}"])
    html << create_table_row(["Zip code", "#{profile.zip}"])
    html << create_table_row(["Address", create_address(profile)])
    html << create_table_row(["Phone", "#{profile.phone}"])
    html << create_table_row(["Cell Phone", "#{profile.cell_phone}"])
    html << create_table_row(["Contact Method", show_contact_method(profile)])
    html << "</table>"
  end

  def generate_job_histories(histories)
    html = "Job History<table>"
    html << create_table_header(["", ""])
    histories.each_with_index do |history|
      html << generate_job_history(history)
    end
    html << "</table>"   
  end

  def generate_job_history(history)
    html = ""
    html << create_table_row(["No", "#{history.number}"])
    html << create_table_row(["Company Name", "#{history.company_name}"])
    html << create_table_row(["Period", "#{work_period(history)}"])
    html << create_table_row(["Hiring Type", "#{history.hiring_type}"])
    html << create_table_row(["Detail", "#{convert_nl_br(history.detail)}"])
    html
  end

  def work_period(history)
    "#{year_month(history.start_month)} ~ #{year_month(history.end_month)}"
  end

  def year_month(day)
    if day.nil?
      "current"
    else
      day.strftime("%Y/%m")
    end
  end

  def create_address(profile)
    address = "#{get_pref_name(profile.pref_code)}#{profile.address0}#{profile.address1}#{profile.address2}"
  end

  def create_table_header(headers)
    html = "<tr>"
    headers.each do |th|
      html << "<th>#{th}</th>"
    end
    html << "</tr>"
  end

  def create_table_row(columns)
    html = "<tr>"
    columns.each do |td|
      html << "<td>#{td}</td>"
    end
    html << "</td>"
  end

  def convert_nl_br(contents)
    contents.gsub("\r\n", "<br/>")
  end

end