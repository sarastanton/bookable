class Book < ApplicationRecord

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :page_count, presence: true
  validates :author_name, presence: true
  validates :genre_name, presence: true

  belongs_to :author
  belongs_to :genre

  has_many :ratings

  has_many :reviews

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

  def self.my_read_books(user)
    read_books = []
    user.books.each do |book|
      book.read_statuses.each do |read_status|
        @read_status = read_status
        if read_status.user_id == user.id && read_status.value == true
          read_books << book
        end
      end
    end
    read_books
  end

  def self.my_unread_books(user)
    unread_books = []
    user.books.each do |book|
      book.read_statuses.each do |read_status|
        if read_status.user_id == user.id && read_status.value == false
          unread_books << book
        end
      end
    end
    unread_books
  end

  def average_rating
    if Rating.find_by(book_id: self.id)
      av_rating = 0
      self.ratings.each do |rating|
        av_rating += rating.value
      end
      result = av_rating.to_f / self.ratings.count
      "#{result.round(1)} / 5.0"
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
    @read_status = ReadStatus.find_by(book_id: self.id, user_id: user.id)
    @read_status.value = true
    @read_status.save
  end


end
