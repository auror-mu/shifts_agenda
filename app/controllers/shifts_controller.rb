class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
  end

  def show
    @shift = Shift.includes(:worker).find(params[:id])
  end
  
end
