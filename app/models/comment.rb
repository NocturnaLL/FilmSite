class Comment < ApplicationRecord
  validates :body, length: {minimum: 2}
  belongs_to :film
  belongs_to :user
end
