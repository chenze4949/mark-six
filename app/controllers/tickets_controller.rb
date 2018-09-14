class TicketsController < ApplicationController
  before_action :authenticate_user!

  def create
    @drawing = Drawing.find(params[:drawing_id])
    if params[:ball_numbers].kind_of?(Array)
      ticket = Ticket.create(drawing_id: @drawing.id, user_id: current_user.id)
      for ball_number in params[:ball_numbers].sort
        Pick.create(ticket_id: ticket.id, ball_number: ball_number)
      end
    end
    redirect_to drawing_path(@drawing)
  end

  private
    def ticket_params
      params.permit(:ball_numbers)
    end
end
