class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET ../users this endpoint not available to public
  def index
    @users = User.all
  end

  # POST ../users
  def create
    @user = User.new(user_params)
    if(@user.save)
      flash[:success] = "Signup successful, welcome to your dashboard!"
      redirect_to user_peak_shaving_plans_path(user_id: @user.id)
    else
      render 'new'
    end
  end

  # Renders the sign up form
  def new
    @user = User.new
  end

  # GET ../users/:id
  def show

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end





end
