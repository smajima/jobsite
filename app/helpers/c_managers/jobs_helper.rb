module CManagers::JobsHelper

  def mail_status(apply_id)
    if Mail.new_from_user(apply_id).first.presence
      "New from User"
    elsif Mail.sent_from_company(apply_id).first.presence
      "Sent"
    else
      "No Mail"
    end
  end
end
