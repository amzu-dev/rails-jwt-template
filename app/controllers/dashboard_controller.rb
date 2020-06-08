# Example Controller To show how the JWT Token validation works.
# This is not needed for a corporate environment and for Microservices.

class DashboardController < ApplicationController
  before_action :authorized
  def index
    render status: :ok
  end
end
