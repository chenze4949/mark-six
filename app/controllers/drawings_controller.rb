class DrawingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @drawings = Drawing.order(id: :desc)
  end
 
  def show
    @drawing = Drawing.find(params[:id])
    @user_tickets = Ticket.where(user_id: current_user.id, drawing_id: params[:id])
    @is_winner = false

    if @drawing.drawing_on and @user_tickets
      @user_tickets.each do |ticket|
        # Compare ticket numbers array and winning numbers array
        if (ticket.ticket_numbers - @drawing.winning_numbers).length() == 0
          @is_winner = true
        end
      end
    end
  end
end
