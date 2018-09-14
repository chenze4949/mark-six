class DrawingsController < ApplicationController
  def index
    @drawings = Drawing.order(id: :desc)
  end
 
  def show
    @drawing = Drawing.find(params[:id])
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
