class HomeController < ApplicationController
    skip_before_action :verify_authenticity_token, :verify_login
    layout "home"
    def index
        @products = Product.paginate(page: params[:page], per_page: 8).order('created_at DESC')
    end
end
