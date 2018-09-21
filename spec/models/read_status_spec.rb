require 'rails_helper'

RSpec.describe ReadStatus, :type => :model do

  before(:all) do

    Author.create(
      :name => "Leigh Bardugo",
      :id => 1
    )

    Genre.create(
      :name => "YA Fantasy",
      :id => 1
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

  let(:read_status) {
    ReadStatus.create(
      :user_id => 1,
      :book_id => 1,
    )
  }


  it "is valid with a user and a book" do
    expect(read_status).to be_valid
  end

  it "is not valid without a book" do
    expect(ReadStatus.new(user_id: 1)).not_to be_valid
  end

  it "is not valid without a user" do
    expect(ReadStatus.new(book_id: 1)).not_to be_valid
  end

  it "has a default value of false" do
    expect(ReadStatus.new.value).to eq(false)
  end

end
