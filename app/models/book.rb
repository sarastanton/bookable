class Book < ApplicationRecord

  validates :title, presence: true
  validates :page_count, presence: true

  belongs_to :author
  belongs_to :genre

  has_many :ratings
  has_many :users, through: :ratings

  has_many :reviews
  has_many :users, through: :reviews

  has_many :user_books
  has_many :users, through: :user_books

  has_many :read_statuses
  has_many :users, through: :read_statuses

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

  # def read(book)
  #   book.read_status == true ? book.update(read_status: false) : book.update(read_status: true)
  # end

  def average_rating
    if Rating.find_by(book_id: self.id)
      av_rating = 0
      self.ratings.each do |rating|
        av_rating += rating.value
      end
      "#{av_rating / self.ratings.count}/5"
    else
      "none"
    end
  end

  def review_count
    if Review.find_by(book_id: self.id)
      self.reviews.count
    else
      "0"
    end
  end

  def add_to_my_books(user)
    user.books << self
    @read_status = ReadStatus.find_or_create_by(book_id: self.id, user_id: user.id)
  end

  def mark_as_read(user)
    @read_status = ReadStatus.find_or_create_by(book_id: self.id, user_id: user.id)
    @read_status.value = true
    @read_status.save
    user.update(pages_read: user.pages_read + self.page_count)
    user.save
  end


end
