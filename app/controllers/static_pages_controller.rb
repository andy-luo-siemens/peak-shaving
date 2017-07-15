class StaticPagesController < ApplicationController
  skip_before_action :authorize_request, only: :home

  def home

  end
end
