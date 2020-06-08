# This is an example class for generating JWT Token.
# This can be used for your single application for user creation and login of users and returning back JWT Token.
# This uses the default JWT Secret from Rails Secret Key base.
# In case of corporate Microservices you do not need this controller.

class TokensController < ApplicationController
  # @return [TrueClass]
  def create
    user = User.new(username: params[:username], password: params[:password], name: params[:name])
    begin
      if user.save!
        token = 'Token ' + JsonWebToken.encode({id: user.id, username: user.username, name: user.name})
        response.set_header('jwt', token )
        render status: :created
      else
        head :not_found
      end
    rescue ActiveRecord::RecordInvalid => e
      render json: {message: e.message}, status: :bad_request
    end
  end

  def login
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      token = 'Token ' + JsonWebToken.encode({id: user.id, username: user.username, name: user.name})
      response.set_header('jwt',token)
    else
      render json: {message: 'Login failed'}, status: :bad_request
    end
  end
end
