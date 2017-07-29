class Sem3GatewaysController < ApplicationController
  before_action :set_user, only: :create
  skip_before_action :authorize_request, only: :index
  def index
    @sem3_gateways = Sem3Gateway.all # this will need to change
  end
  # POST ../users/:user_id/sem3_gateways
  def create
    @sem3_gateway = Sem3Gateway.new(create_params.merge(user_id: @api_user.id))
    @sem3_gateway.save!
    json_response(@sem3_gateway, :created)
  end

  def set_user
    @api_user = User.find(params[:user_id])
  end

  def create_params
    params.permit(:mac_address, :name)
  end
end
