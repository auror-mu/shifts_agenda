class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to workers_path(@worker)
    else
      render :new
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      redirect_to worker_path(@worker)
    else
      render :edit
    end
  end


  private
  
  def set_worker
    @worker = worker.find(params[:id])
  end
  def worker_params
    params.require(:worker).permit(:first_name, :status)
  end
end
