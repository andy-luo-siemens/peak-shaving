class MetersController < ApplicationController
  skip_before_action :authorize_request
  def index
    @Meters = Meter.all # this will need to change
  end
end
