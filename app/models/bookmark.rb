class Bookmark < ApplicationRecord
  validates :movie, presence: true
  validates :list, presence: true
  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list, message: "you already added this bookmark" }
  belongs_to :movie
  belongs_to :list
end
