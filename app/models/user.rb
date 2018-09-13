class User < ApplicationRecord
  has_many :tickets, class_name: "Ticket", foreign_key: "user_id"
end
