class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :verify_login

  private

  def verify_login
    unless logged_in?
      store_location
      flash[:error] = "Please log in."
      redirect_to login_path
    end
  end
end
