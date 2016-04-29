class API::V1::VehiclesController < ApplicationController
  respond_to :json

  def index
    @vehicles = current_user.vehicles
  end

end