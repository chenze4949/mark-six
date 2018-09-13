class Ticket < ApplicationRecord
  has_many: picks, foreign_key: "ticket_id", class_name: "Pick"
end
