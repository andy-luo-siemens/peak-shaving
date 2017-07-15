require 'jwt_utility'

class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user_by_token
  end

  def user_by_token
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || (errors.add :token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JWTUtility.decode(http_auth_header)
  end

  def http_auth_header
    if @headers['Authentication-Token'].present?
      return @headers['Authentication-Token'].split(' ').last
    else
      errors.add :token, 'Missing token'
    end
    nil
  end
end
