class StatusesController < ApplicationController

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      @status.likes = 0
      redirect_to statuses_path, notice: 'Status was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
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
    @status = status.find(params[:id])
    @status.likes = @status.likes + 1
  end

  private

  def status_params
    params.require(:status).permit(:status, :user, :likes)
  end

end
