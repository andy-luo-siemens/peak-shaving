class PeakShavingPlansController < ApplicationController
  before_action :set_user, only: [:index]
  skip_before_action :authorize_request

  def index

  end

  private
  def set_user
    @user = User.find(params[:user_id])
    puts @user.name
  end
end
