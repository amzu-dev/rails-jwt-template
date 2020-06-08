class ApplicationController < ActionController::API
  # If you want to validate JWT for all the requests you can do so by uncommenting the below and
  # inherit this ApplcationController for any new controller you create.
  # In this example: I have disabled filters and created some example controllers
  # like token controller that will generate JWT token with the default HMAC Secret from the
  # Rails secret key base.
  # before_action :authorized

  def not_found
    render json: { error: 'not_found' }
  end

  def header
    h = request.headers['Authorization']
    h&.split(' ')&.last
  end

  # @return [User]
  def authorized
    begin
      decoded = JsonWebToken.decode(header)
      @current_user = User.find(decoded[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

end
