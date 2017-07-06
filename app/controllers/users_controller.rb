class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET ../users this endpoint not available to public
  def index
    @users = User.all
  end

  # POST ../users
  def create

  end

  # Renders the sign up form
  def new

  end

  # GET ../users/:id
  def show

  end





end
