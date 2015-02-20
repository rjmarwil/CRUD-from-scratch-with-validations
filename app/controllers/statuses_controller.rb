class StatusesController < ApplicationController

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    @status.likes = 0
    if @status.save
      redirect_to statuses_path, notice: 'Status was successfully created.'
    else
      render :new
    end
  end

  def show
    @status = Status.find(params[:id])
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update(status_params)
      redirect_to statuses_path, notice: 'Status was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to statuses_path, notice: 'Status was successfully destroyed.'
  end

  def like
    @status = Status.find(params[:id])
    @status.likes += 1
    @status.save
    redirect_to statuses_path
  end

  private

  def status_params
    params.require(:status).permit(:status, :user, :likes)
  end

end
