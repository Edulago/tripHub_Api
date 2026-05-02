class ApplicationController < ActionController::API
  private

  def authenticate_request
    token = bearer_token
    decoded = ::JsonWebToken.decode(token) if token.present?

    @current_user = User.find_by(id: decoded[:user_id]) if decoded

    render json: { error: "Not Authorized" }, status: :unauthorized unless @current_user
  end

  def current_user
    @current_user
  end

  def bearer_token
    header = request.headers["Authorization"]
    scheme, token = header.to_s.split(" ", 2)

    return token if scheme == "Bearer" && token.present?

    nil
  end
end
