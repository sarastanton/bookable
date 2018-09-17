class Author < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :books
  has_many :genres, through: :books

end
