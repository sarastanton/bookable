require 'rails_helper'
describe "Feature Test: Create an author", :type => :feature do

before(:all) do
  User.create(username: "Test", password: "test")
  visit '/'
  click_link "Sign In"
  fill_in "user_username", with: "Test"
  fill_in "user_password", with: "test"
  click_button "Log In"
end

it "creates a new author using a form" do
  #1. Go to author index and find a button to "Add New Author"
  visit authors_path
  #2. Click on the "Add New Author" button
  click_button "Add New Author"
  #3. Fill in the author form input for name
  fill_in "author_name", with: "J.K. Rowling"
  #4. Click on "Create Author" button
  click_button "Create Author"
  #5. Redirect to new author show page
  #6. New author show page should include name from input form
  expect(page).to have_content("J.K. Rowling")
  end

end
