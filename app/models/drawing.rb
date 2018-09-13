class Drawing < ApplicationRecord
  has_many :tickets, class_name: "Ticket", foreign_key: "drawing_id"
end
