class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # A movie must have a unique title and an overview.
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
