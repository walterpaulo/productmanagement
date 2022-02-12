module ApplicationHelper
  def id_user
    if cookies[:product_admin].blank?
      redirect_to "/login"
      return
    end
    JSON.parse(cookies[:product_admin]).values.first.to_i
  end

  def flash_message
    messages = ""
    %i[notice info warning danger success].each do |type|
      messages += "<div class=\"alert alert-#{type}\" role='alert'>#{flash[type]}</div>" if flash[type]
    end
    messages.html_safe
  end
end
