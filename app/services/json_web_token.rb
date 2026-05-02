require "jwt"

class JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base.to_s
  ALGORITHM = "HS256"

  def self.encode(payload, exp = 24.hours.from_now)
    payload = payload.merge(exp: exp.to_i)
    ::JWT.encode(payload, SECRET_KEY, ALGORITHM)
  end

  def self.decode(token)
    decoded = ::JWT.decode(token, SECRET_KEY, true, { algorithm: ALGORITHM, verify_expiration: true })[0]
    HashWithIndifferentAccess.new(decoded)
  rescue ::JWT::DecodeError, ::JWT::ExpiredSignature
    nil
  end
end
