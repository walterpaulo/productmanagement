class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token, :verify_login
    layout "login"

def index
end

def login
    debugger
    x=""
    if params[:email].present? && params[:password].present?
        adm = User.where(email: params[:email], password: params[:password])
        if adm.count > 0
            admin = adm.first
            time = params[:remember] == "1"? 1.year.from_now : 30.minutes.from_now
            value = {
                id: admin.id,
                name: admin.name,
                email: admin.email
            }
            cookies[:product_admin] = { value: value.to_json, expires: time, httponly: true }
            redirect_to "/"
        else
            flash[:error] = "Invalid login and password!"
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