class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_action :authorize_request, except: :hello

  def authorize_request
    authorize = AuthorizeApiRequest.call(request.headers)
    if authorize.success?
      @current_user = authorize.result
    else
      render json: { errors: authorize.errors }, status: :unauthorized
    end
  end

  def hello
    render html: "Time to make the donuts. Sorry Adam..."
  end
end
