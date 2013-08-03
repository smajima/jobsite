# encoding:utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  def add_recent_see(job_id)
    add_job = job_id.to_s
    current = recent_see
    if current.include?(add_job)
      current.delete(add_job)
    end
    current << add_job
    start = current.size > 10 ? current.size - 10 : 0
    current = current.slice(start, 10)
    cookies[:see_jobs] = {:value => current.join(","), :expires => 2.weeks.from_now, :httponly => true}
  end

  def recent_see
    recent = cookies[:see_jobs]
    if recent.nil?
      []
    else
      recent.split(",")
    end
  end

  def recent_see_jobs
    jobs = recent_see.map {|x| Job.find(x.to_i)}
  end

  private
  def after_sign_in_path_for(resource)
    if resource.kind_of?(User)
      root_path
    elsif resource.kind_of?(Admin)
      top_admins_top_path
    elsif resource.kind_of?(CManager)
      top_c_managers_top_path
    end
  end

  def after_sign_out_path_for(resource)   
    if resource == :user
      root_path
    elsif resource == :admin
      new_admin_session_path
    elsif resource == :c_manager
      new_c_manager_session_path
    end
  end
end
