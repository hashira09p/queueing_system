class WorkStationsController < ApplicationController
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
  end

  def show; end

  def edit; end
end
