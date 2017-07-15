
class JWTUtility
  class << self
    def encode(payload, expires = 24.hours.from_now)
      payload[:expires] = expires.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new payload
    rescue
      nil
    end
  end
end
