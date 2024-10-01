class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @qrcode = RQRCode::QRCode.new(ticket_link)

    @qrcode_png = @qrcode.as_svg(
      light: "\033[47m", dark: "\033[40m",
      fill_character: "  ",
      quiet_zone_size: 4
    )
  end

  def generate
    cookies[:ticket_id] = Ticket.where(created_at: Time.current.beginning_of_day...Time.current.end_of_day).count
    @ticket = Ticket.new
    @ticket.ticket_number = cookies[:ticket_id] + 1
    @ticket.save
    redirect_to ticket_path(@ticket)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_link
    "#{request.base_url}#{generate_tickets_path}"
  end
end