class WorkStationsController < ApplicationController
  before_action :set_work_station, only: [:show, :edit, :update, :destroy]
  def index
    @work_stations = WorkStation.all
  end

  def new
    @work_station = WorkStation.new
  end

  def create
    @work_station = WorkStation.new
    @work_station.name = params[:work_station][:name]
    @work_station.status = params[:work_station][:status]
    @work_station.save
    redirect_to work_station_path(@work_station)
  end

  def work_stations
    @work_stations = WorkStation.all
  end

  def edit; end

  def update
    if @work_station.update(work_station_params)
       redirect_to work_stations_path
    end
  end

  def destroy
    if @work_station.destroy
      redirect_to work_stations_path
    end
  end

  private
  def set_work_station
    @work_station = WorkStation.find(params[:id])
  end

  def work_station_params
    params.require(:work_station).permit(:name, :status)
  end
end
