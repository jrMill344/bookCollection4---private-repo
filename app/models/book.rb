class Book < ApplicationRecord
  validates :title, :author, :price, :published_date, presence: true
  validates :price, numericality: true
end
