class ApplicationController < ActionController::Base
    before_action :verify_authenticity_token 

    def verify_authenticity_token
        unless cookies[:product_admin].present?
            redirect_to "/login"
        end
    end
end
