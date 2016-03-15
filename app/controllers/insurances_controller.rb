class InsurancesController < ApplicationController
  def create
    @insurance = current_user.vehicles.insurances.build(insurance_params)
    if @insurance.save
      flash[:success] = "New insurance added!"
      redirect_to current_user
    else
      flash[:danger] = "Houston, we got a problem!"
      redirect_to current_user
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def insurance_params
      params.require(:insurance).permit(:name, :issue_date, :expiry_date)
    end

end
