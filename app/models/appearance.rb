class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode
  belongs_to :producer, foreign_key: "user_id", class_name: "User"

  validates :rating, inclusion: { in: 1..5 }
end
