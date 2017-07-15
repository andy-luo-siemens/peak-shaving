require 'jwt_utility'

class AuthenticateUser
  prepend SimpleCommand

  def initialize(credentials)
    @email = credentials['email']
    @password = credentials['password']
  end

  def call
    errors.add :user_auth, 'missing credentials (email)' unless @email
    errors.add :user_auth, 'missing credentials (password)' unless @password
    if @email && @password
      user = user_by_credentials
      return JWTUtility.encode(user_id: user.id) if user
    end
  end

  private

  attr_accessor :email, :password

  def user_by_credentials
    user = User.find_by_email(@email)
    unless user
      errors.add :user_auth, 'email not found'
      return nil
    end
    password_correct = user.authenticate(@password)
    unless password_correct
      errors.add :user_auth, 'incorrect password'
      return nil
    end
    return user if user && password_correct
  end
end
