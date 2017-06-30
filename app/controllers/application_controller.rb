class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "Time to make the donuts. His name was Robert Paulson"
  end
end
