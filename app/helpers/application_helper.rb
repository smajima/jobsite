module ApplicationHelper

  def spacing(spaces = 2)
    sp = "&nbsp;"*spaces
    sp.html_safe
  end

  def create_job_category
    create_select(Job::JOB_CATEGORY)
  end

  def create_pref_select
    create_select(Prefucture::PREF_CODE)
  end

  def get_pref_name(id)
    get_name(Prefucture::PREF_CODE, id)
  end

  def create_select(select_array)
    created_array = []
    select_array.each { |hash|
      created_array << [hash[:name], hash[:id]]
    }
    created_array
  end

  def get_job_category_name(id)
    get_name(Job::JOB_CATEGORY, id)
  end

  def get_name(hash_array, id)
    name = nil
    hash_array.map {|hash|
      name = hash[:name] if hash[:id] == id
    }
    name
  end

  def form_error?(symbol, errors)
    return false if errors.nil?
    return true if errors.messages.has_key?(symbol)
  end

  def div_error(html)
    return "<div class='field_with_errors'>#{html}</div>".html_safe
  end
end
