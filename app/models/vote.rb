class Vote < ApplicationRecord
  belongs_to :film
  belongs_to :user

  validates :rating, inclusion: (1..5)
  validates :user_id, uniqueness: {scope: :film_id}
end
