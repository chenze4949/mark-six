class DrawingOpenWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(drawing_id)
    drawing = Drawing.find(drawing_id)
    winning_numbers = (1...10).to_a.shuffle.take(6).sort
    for winning_number in winning_numbers
      WinningPick.create(drawing_id: drawing.id, ball_number: winning_number)
    end
    drawing.update_attribute(:drawing_on, Time.now)
  end
end
