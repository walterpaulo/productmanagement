class SessionsController < ApplicationController
  def new; end

  def create
    email = params.as_json['session']['email']
    password = params.as_json['session']['password']
    user = User.find_by(email: email)
    if user.password == password
      log_in user
      redirect_to produts_path
    else
      redirect_to login_url
    end
  end

  def destroy
    # Remove the user id from the session
    session.delete(:current_user_id)
    # Clear the memoized current user
    @_current_user = nil
    redirect_to login_url
  end
end
