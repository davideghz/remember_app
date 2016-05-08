class API::V1::VehiclesController < ApplicationController

  acts_as_token_authentication_handler_for User

  respond_to :json

  def index
    @vehicles = current_user.vehicles
  end

end