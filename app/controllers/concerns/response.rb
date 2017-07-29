module Response
  def json_response(object, status=:ok)
    render json: object, status: status
  end

  def json_response_include(object, inc, status=:ok)
    render json: object, include: inc, status: status
  end
end
