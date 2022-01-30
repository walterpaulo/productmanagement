class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token 

def index
    render layout: false
end

def login
    if params[:email].present? && params[:password].present?
        adm = User.where(email: params[:email], password: params[:password])
        if adm.count > 0
            cookies[:product_admin] = { value: adm.first.id, expires: 1.year.from_now, httponly: true }
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