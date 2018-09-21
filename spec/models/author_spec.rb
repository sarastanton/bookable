require 'rails_helper'

RSpec.describe Author, :type => :model do
  let(:author) {
    Author.create(
      :name => "Stephen King",
    )
  }

  it "is valid with a name" do
    expect(author).to be_valid
  end

  it "is not valid without a name" do
    expect(Author.new).not_to be_valid
  end

  end
