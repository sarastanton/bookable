class Genre < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :books
  has_many :authors, through: :books

end
