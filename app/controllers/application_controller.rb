class ApplicationController < ActionController::Base
    before_action :verify_login 

    def verify_login
        if cookies[:product_admin].present?
            hash_admin = JSON.parse(cookies[:product_admin])
            if hash_admin["id"].present?
                administrators = User.where(id: hash_admin["id"])
                if administrators.count > 0
                    @administrator = administrators.first
                    return
                end
            end
        end
        redirect_to "/login"
    end
end
