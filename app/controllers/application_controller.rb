class ApplicationController < ActionController::Base
    include SessionsHelper

    private
    def verify_login
        unless logged_in?
            store_location
            flash[:error] = "Please log in."
            redirect_to login_url
        end
    end
end
