class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  has_many :user_books
  has_many :users, through: :user_books

  def read(book)
    book.read_status == true ? book.update(read_status: false) : book.update(read_status: true)
  end

  def average_rating(book)
    rating = nil
    User.all.each do |user|
      user.books.each do |book|
        rating += book.rating
      end
    end
    rating
  end

end
