class VehiclesController < ApplicationController
  before_action :authenticate_user!,  only: [:create, :destroy] #-> routes to the login / signup if not authenticated
  before_action :correct_user,        only: [:destroy, :edit, :update]

  def create
    @vehicle = current_user.vehicles.build(vehicle_params)
    if @vehicle.save
      flash[:success] = "New vehicle added!"
      redirect_to current_user
    else
      flash[:danger] = "Houston, we got a problem!"
      render current_user
    end
  end

  def edit
    # @vehicle is already defined in correct_user which is called before_action
  end

  def update
    # @vehicle is already defined in correct_user which is called before_action
    if @vehicle.update_attributes(vehicle_params)
      flash[:success] = "Vehicle updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @vehicle.destroy
    flash[:success] = "Vehicle removed"
    redirect_to request.referrer || root_url
  end

  private

    def vehicle_params
      params.require(:vehicle).permit(:name, :matriculation_date)
    end

    # before filters

    # Each user can remove only the vehicles he owns
    def correct_user
      @vehicle = current_user.vehicles.find_by(id: params[:id])
      if @vehicle.nil?
        flash[:danger] = "You can't access this vehicle!"
        redirect_to root_url
      end
    end

end
