class HomeController < ApplicationController
  layout "home"
  def index
    @products = Product.paginate(page: params[:page], per_page: 8).order('created_at DESC')
  end
end
