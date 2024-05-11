class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update]

  def index
    @workers = Worker.all
  end

  def show
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    
    if @worker.save
      redirect_to workers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @worker.update(worker_params)
      redirect_to worker_path(@worker)
    else
      render :edit
    end
  end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:first_name, :status)
  end
end
