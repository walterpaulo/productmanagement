class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.select(:id, :name, :email).paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User #{@user.email} was successfully created!"
      redirect_to users_url
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    id_login = JSON.parse(cookies[:product_admin]).values.first.to_i
    if id_login == @user.id
      flash[:warning] = "Error: user #{@user.email} logged in."
      redirect_to users_url
    else
      @user.destroy
      flash[:danger] = "User #{@user.email} has been deleted."
      redirect_to users_url
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.select(:id, :name, :email).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
