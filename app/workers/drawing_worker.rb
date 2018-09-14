class DrawingWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform()
    drawing = Drawing.create(
      title: 'Mark Six',
      drawing_type: 'mark_six'
    )
    if drawing.save
      DrawingWorker.perform_in(1.minutes)
      DrawingOpenWorker.perform_in(1.minutes, drawing.id)
    end
  end
end