class SessionsController < ApplicationController
  skip_before_action :verify_login
  layout "login"

  def new; end

  def create
    email = params.as_json['session']['email']
    password = params.as_json['session']['password']
    user = User.find_by(email: email)
    if user.present? && email.present? && password.present?
      if user.authenticate(password)
        log_in user
        redirect_to products_path
      else
        flash[:error] = "Invalid login or password!"
        redirect_to login_url
      end
    else
      flash[:error] = "Invalid login or password!"
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:current_user_id)
    session.clear
    redirect_to login_url
  end
end
