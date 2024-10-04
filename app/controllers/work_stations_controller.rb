class WorkStationsController < ApplicationController
  #railsbefore_action :set_work_station, only: [:show, :edit, :update, :destroy, :next, :finish]
  before_action :set_work_station, except: [:index, :new, :create, :queueing_lists]

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
    redirect_to root_path
  end

  def edit; end

  def update
    if @work_station.update(work_station_params)
      redirect_to work_station_path(@work_station)
    end
    # render json: params
  end

  def show
    @pending_tickets = Ticket.where(available_transaction_id: @work_station.available_transactions.ids).pending
    @serving_ticket = @work_station.tickets.active.first
  end

  def destroy
    if @work_station.destroy
      redirect_to work_stations_path
    end
  end

  def online
    @work_station.online!
    redirect_to work_station_path(@work_station)
  end

  def offline
    @work_station.offline!
    redirect_to work_station_path(@work_station)
  end

  def break
    @work_station.break!
    redirect_to work_station_path(@work_station)
  end

  def next
    @pending_ticket = Ticket.pending.first
    @pending_ticket.update(status: :active, active_at: Time.current, work_station: @work_station)
    redirect_to work_station_path(@work_station)
  end

  def finish
    @active_ticket = @work_station.tickets.active.first
    @active_ticket.update(status: :finished, finished_at: Time.current)
    redirect_to work_station_path(@work_station)
  end

  def queueing_lists
    @work_stations = WorkStation.includes(:tickets).all
  end

  private

  def set_work_station
    @work_station = WorkStation.find(params[:id] || params[:work_station_id])

  end

  def work_station_params
    params.require(:work_station).permit(:name, :status, available_transaction_ids: [])
  end
end
