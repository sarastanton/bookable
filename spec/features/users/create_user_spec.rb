require 'rails_helper'
describe "Feature Test: Create a user", :type => :feature do

before(:all) do

end


it "creates a new user with signup form" do
  visit '/'
  click_link "Sign Up"
  fill_in "user_username", with: "Test2"
  fill_in "user_password", with: "test"
  fill_in "user_password_confirmation", with: "test"
  click_button "Create Account"
  expect(page).to have_content("You are logged in as Test2")
  end

end
