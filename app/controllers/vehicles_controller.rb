class VehiclesController < ApplicationController
  before_action :authenticate_user!,  only: [:create, :destroy] #-> routes to the login / signup if not authenticated
  before_action :correct_user,        only: [:destroy, :edit, :update]

  def show
    @vehicle = Vehicle.find(params[:id])
    @user = User.find(params[:user_id])

    if @vehicle.insurance
      @insurance = @vehicle.insurance
    else
      @insurance = Insurance.new
    end

    add_breadcrumb "home", :root_path
    add_breadcrumb "my vehicles", :current_user
    add_breadcrumb :set_vehicle_name, :user_vehicle_path
  end

  def create
    @vehicle = current_user.vehicles.build(vehicle_params)
    if @vehicle.save
      flash[:success] = "New vehicle added!"
      redirect_to current_user
    else
      flash[:danger] = "Houston, we got a problem!"
      redirect_to current_user
    end
  end

  def edit
    # @vehicle is already defined in correct_user which is called before_action
  end

  def update
    # @vehicle is already defined in correct_user which is called before_action
    if @vehicle.update_attributes(vehicle_params)
      flash[:success] = "Vehicle updated"
      redirect_to user_vehicle_path
    else
      render 'edit'
    end
  end

  def destroy
    @vehicle.destroy
    flash[:success] = "Vehicle removed"
    redirect_to current_user
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

    #return vehicle name for breadcrumb
    def set_vehicle_name
      @vehicle.name
    end
    helper_method :set_vehicle_name

end
