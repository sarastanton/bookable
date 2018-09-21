require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :username => "Evan",
      :password => "password",
    )
  }

  it "is valid with a username and password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(username: "Name")).not_to be_valid
  end

  it "has a starting pages read count of 0" do
    expect(user.pages_read).to eq(0)
  end


end
