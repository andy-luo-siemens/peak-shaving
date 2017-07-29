class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    authenticate = AuthenticateUser.call(authenticate_params)
    if authenticate.success?
      user = User.find_by_email(params[:email])
      render json: { auth_token: authenticate.result, user_id: user.id }
    else
      render json: { errors: authenticate.errors }, status: :unauthorized
    end
  end
  def authenticate_params
    params.permit(:email, :password)
  end
end
