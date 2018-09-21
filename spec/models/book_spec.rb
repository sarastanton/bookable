require 'rails_helper'

RSpec.describe Book, :type => :model do

  before(:all) do

    Author.create(
      :name => "Jay Kristoff",
    )

    Genre.create(
      :name => "Young adult",
    )

  end

  let(:book) {
    Book.create(
      :title => "Nevernight",
      :author_id => 1,
      :genre_id => 1,
      :page_count => 429
    )
  }

  let (:user) {
    User.create(
      :username => "Gerald",
      :password => "test"
    )
  }

  it "is valid with a title, genre, author, and page count" do
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    expect(Book.new(author_id: 1,  genre_id: 1,  page_count: 462)).not_to be_valid
  end

  it "is not valid without a genre" do
    expect(Book.new(title: "Six of Crows", author_id: 1,  page_count: 462)).not_to be_valid
  end

  it "is not valid without an author" do
    expect(Book.new(title: "Six of Crows", genre_id: 1,  page_count: 462)).not_to be_valid
  end

  it "is not valid without a page count" do
    expect(Book.new(title: "Six of Crows", author_id: 1,  genre_id: 1)).not_to be_valid
  end

  it "allows user to save to their book list" do
    book.add_to_my_books(user)
    expect(user.books).to include(book)
  end

  it "can be marked as read by user" do
    book.add_to_my_books(user)
    book.mark_as_read(user)
    read_status = ReadStatus.find_by(user_id: user.id, book_id: book.id)

    expect(read_status.value).to eq(true)
  end

end
