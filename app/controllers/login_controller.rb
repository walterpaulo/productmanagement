class LoginController < ApplicationController
  skip_before_action :verify_login
  layout "login"

  def index; end

  def login
    if params[:email].present? && params[:password].present?
      adm = User.find_by(email: params[:email])
      if adm && adm.authenticate(params[:password])
        time = params[:remember] == "1" ? 1.year.from_now : 30.minutes.from_now
        value = {
          id: adm.id,
          name: adm.name,
          email: adm.email
        }
        cookies[:product_admin] = { value: value.to_json, expires: time, httponly: true }
        redirect_to "/products"
      else
        flash[:error] = "Invalid login or password!"
        redirect_to "/login"
      end
    else
      flash[:error] = "Invalid login and password!"
      redirect_to "/login"
    end
  end

  def logout
    cookies[:product_admin] = nil
    redirect_to "/login"
  end
end
