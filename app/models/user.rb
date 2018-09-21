class User < ApplicationRecord

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password

  has_many :ratings

  has_many :reviews

  has_many :read_statuses
  has_many :books, through: :read_statuses

end
