class SessionsController < ApplicationController
  skip_before_action :authorize_request, only: %i[new create]

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_peak_shaving_plans_path(user_id: user.id)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
