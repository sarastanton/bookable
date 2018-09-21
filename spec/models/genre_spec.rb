require 'rails_helper'

RSpec.describe Genre, :type => :model do
  let(:genre) {
    Author.create(
      :name => "Nonfiction",
    )
  }

  it "is valid with a name" do
    expect(genre).to be_valid
  end

  it "is not valid without a name" do
    expect(Genre.new).not_to be_valid
  end

  end
