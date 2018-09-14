class Drawing < ApplicationRecord
  has_many :tickets, class_name: "Ticket", foreign_key: "drawing_id", dependent: :delete_all
  has_many :winning_picks, class_name: "WinningPick", foreign_key: "drawing_id", dependent: :delete_all

  def winning_numbers
    numbers = Array.new
    self.winning_picks.each do |pick|
      numbers.push(pick.ball_number)
    end
    return numbers.sort
  end
end
