require 'sidekiq-scheduler'

class DrawingWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform()
    drawing = Drawing.new(
      title: 'Mark Six',
      drawing_type: 'mark_six'
    )
    if drawing.save
      DrawingOpenWorker.perform_in(1.minutes, drawing.id)
    end
  end
end