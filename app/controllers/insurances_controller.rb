class InsurancesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @vehicle = @user.vehicles.find(params[:vehicle_id])
    @insurance = @vehicle.create_insurance(insurance_params) #todo: this works but does not include user_id, have to add it below
    @insurance.user_id = @user.id

    if @insurance.save
      flash[:success] = "New insurance added!"
      redirect_to user_vehicle_path(current_user, @vehicle)
    else
      flash[:danger] = "Houston, we got a problem!"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @vehicle = Vehicle.find_by(id: params[:vehicle_id])
    @insurance = Insurance.find_by(id: params[:id])
    @insurance.destroy
    flash[:success] = "Insurance removed"
    redirect_to user_vehicle_path(current_user, @vehicle)
  end

  private

    def insurance_params
      params.require(:insurance).permit(:name, :issue_date, :expiry_date)
    end

end
