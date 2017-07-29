class MetersController < ApplicationController
  skip_before_action :authorize_request
  def index
    @Meters = Meter.all # this will need to change
  end
  # POST ../users/:user_id/meters
  def create

  end
end
