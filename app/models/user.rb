class User < ApplicationRecord

  has_secure_password

  has_many :user_books
  has_many :books, through: :user_books

  has_many :ratings
  has_many :books, through: :ratings

  has_many :reviews
  has_many :books, through: :reviews


end
