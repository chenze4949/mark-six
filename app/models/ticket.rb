class Ticket < ApplicationRecord
  has_many :picks, class_name: "Pick", foreign_key: "ticket_id", dependent: :delete_all
end
