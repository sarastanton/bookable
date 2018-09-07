class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  has_many :ratings
  has_many :books, through: :ratings

  has_many :reviews
  has_many :books, through: :reviews

  has_many :user_books
  has_many :users, through: :user_books

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
  end

  def author_name
    self.author ? self.author.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def read(book)
    book.read_status == true ? book.update(read_status: false) : book.update(read_status: true)
  end

  def average_rating
    av_rating = 0
    self.ratings.each do |rating|
      av_rating += rating.value
    end
    av_rating / self.ratings.count
  end

end
