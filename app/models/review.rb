class Review < ApplicationRecord

  validates :content, presence: true
  validates :user_id, presence: true
  validates :book_id, presence: true

  belongs_to :user
  belongs_to :book

  def self.my_reviews(book, user)
    where(book_id: book.id, user_id: user.id)
  end

end
