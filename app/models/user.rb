class User < ApplicationRecord
  has_many: tickets, foreign_key: "user_id", class_name: "Ticket"
end
