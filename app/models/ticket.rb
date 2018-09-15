class Ticket < ApplicationRecord
  has_many :picks, class_name: "Pick", foreign_key: "ticket_id", dependent: :delete_all

  def ticket_numbers
    numbers = Array.new
    self.picks.each do |pick|
      numbers.push(pick.ball_number)
    end
    return numbers
  end
end
