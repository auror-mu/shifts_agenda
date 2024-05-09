class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
  end

  def show
    @shift = Shift.includes(:worker).find(params[:id])
  end

  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      redirect_to @shift
    else
      render :new
    end
  end

end

private

def set_shift
  @shift = shift.find(params[:id])
end

def shift_params
  params.require(:shift).permit(:user_id, :start_date)
end
