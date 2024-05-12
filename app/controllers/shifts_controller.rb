class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
  end

  def show
    @shift = Shift.includes(:worker).find(params[:id])
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)

    if Worker.exists?(id: params[:shift][:user_id])
      if @shift.save
        redirect_to shifts_path
      else
        render :new
      end
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:user_id, :start_date)
  end
end
