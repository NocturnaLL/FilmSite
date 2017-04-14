class Category < ApplicationRecord
  validates :title, uniqueness: true

  has_many :films

  def top_ideas
  films
      .joins(:votes)
      .select("films.*, avg(votes.rating) as point")
      .group("films.id")
      .order("point DESC")
      .limit(10)
  end
end
