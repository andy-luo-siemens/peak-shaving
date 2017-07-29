class MetersController < ApplicationController
  before_action :set_user, only: :create
  before_action :set_sem3_controller, only: :create
  skip_before_action :authorize_request, only: :index

  def index
    @meters = Meter.all
  end

  def create
    @meter = Meter.new(create_params.merge(
      user_id: @api_user.id,
      sem3_controller_id: @sem3_controller.id,
      is_active: false
    ))
    @meter.save!
    json_response(@meter, :created)
  end

  def set_user
    @api_user = User.find(params[:user_id])
  end

  def set_sem3_controller
    @sem3_controller = Sem3Controller.find(params[:sem3_controller_id])
  end

  def create_params
    params.permit(:name, :address, :sem3_controller_id)
  end
end
