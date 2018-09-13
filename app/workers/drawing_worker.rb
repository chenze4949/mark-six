require 'sidekiq-scheduler'

class DrawingWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform()
    Drawing.create(
      title: 'Mark Six',
      drawing_typoe: 'mark_six'
    )
  end
end
