class Sem3ControllersController < ApplicationController
  before_action :set_user, only: :create
  before_action :set_sem3_gateway, only: :create
  skip_before_action :authorize_request, only: :index

  def create
    @sem3_controller = Sem3Controller.new(create_params.merge(
      user_id: @api_user.id,
      sem3_gateway_id: @sem3_gateway.id
    ))
    @sem3_controller.save!
    json_response(@sem3_controller, :created)
  end

  def set_user
    @api_user = User.find(params[:user_id])
  end

  def set_sem3_gateway
    @sem3_gateway = Sem3Gateway.find(params[:sem3_gateway_id])
  end

  def create_params
    params.permit(:name, :address)
  end
end
