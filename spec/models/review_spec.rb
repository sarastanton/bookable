require 'rails_helper'

RSpec.describe Review, :type => :model do

  before(:all) do

    Author.find_or_create_by(
      :name => "Leigh Bardugo",
    )

    Genre.create(
      :name => "YA Fantasy",
    )

    Book.create(
      :title => "Crooked Kingdom",
      :author_id => 1,
      :genre_id => 1,
      :page_count => 536
    )

    User.create(
      :username => "Fiona",
      :password => "test"
    )

  end

  let(:review) {
    Review.create(
      :content => "Really loved this book!",
      :user_id => 1,
      :book_id => 1,
    )
  }


  it "is valid with a user, a book, and content" do
    expect(review).to be_valid
  end

  it "is not valid without a book" do
    expect(Review.new(content: 1, user_id: 1)).not_to be_valid
  end

  it "is not valid without a user" do
    expect(Review.new(content: "Meh", book_id: 1)).not_to be_valid
  end

  it "is not valid without content" do
    expect(Review.new(book_id: 1, user_id: 1)).not_to be_valid
  end

end
