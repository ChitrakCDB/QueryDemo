class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :producer

  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end
end
