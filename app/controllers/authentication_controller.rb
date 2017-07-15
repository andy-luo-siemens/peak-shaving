class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    authenticate = AuthenticateUser.call(authenticate_params)
    if authenticate.success?
      render json: { auth_token: authenticate.result }
    else
      render json: { errors: authenticate.errors }, status: :unauthorized
    end
  end
  def authenticate_params
    params.permit(:email, :password)
  end
end
