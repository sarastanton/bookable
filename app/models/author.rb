class Author < ApplicationRecord

  validates :name, presence: true

  has_many :books
  has_many :genres, through: :books

end
