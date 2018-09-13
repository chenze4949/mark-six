class TicketsController < ApplicationController
  before_action :authenticate_user!

  def create
    @drawing = Drawing.find(params[:drawing_id])
    ticket = Ticket.create(drawing_id: @drawing.id, user_id: current_user.id)
    Pick.create(ticket_id: ticket.id, ball_number: ticket_params['pick_1'])
    Pick.create(ticket_id: ticket.id, ball_number: ticket_params['pick_2'])
    Pick.create(ticket_id: ticket.id, ball_number: ticket_params['pick_3'])
    Pick.create(ticket_id: ticket.id, ball_number: ticket_params['pick_4'])
    Pick.create(ticket_id: ticket.id, ball_number: ticket_params['pick_5'])
    Pick.create(ticket_id: ticket.id, ball_number: ticket_params['pick_6'])
    redirect_to drawing_path(@drawing)
  end

  private
    def ticket_params
      params.require(:ticket).permit(:pick_1, :pick_2, :pick_3, :pick_4, :pick_5, :pick_6)
    end
end
