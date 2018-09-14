class Drawing < ApplicationRecord
  has_many :tickets, class_name: "Ticket", foreign_key: "drawing_id", dependent: :delete_all
  has_many :winning_picks, class_name: "WinningPick", foreign_key: "drawing_id", dependent: :delete_all

  def current_tickets
    Ticket.find_by(user_id: current_user.id, drawing_id: self.id)
  end
end
