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
        if (ticket.ticket_numbers - @drawing.winning_numbers).length() == 0
          @is_winner = true
        end
      end
    end
    
  end

  def new
    @drawing = Drawing.new
  end

  def create
    @drawing = Drawing.new(drawing_params)

    if @drawing.save
      redirect_to @drawing
      DrawingWorker.perform_in(1.minutes)
      DrawingOpenWorker.perform_in(1.minutes, @drawing.id)
    else
      render 'new'
    end
  end

  def destroy
    @drawing = Drawing.find(params[:id])
    @drawing.destroy
   
    redirect_to drawings_path
  end

  private
  def drawing_params
    params.require(:drawing).permit(:title, :drawing_type)
  end
end
