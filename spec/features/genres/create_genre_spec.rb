require 'rails_helper'
describe "Feature Test: Create a genre", :type => :feature do

before(:all) do
  visit '/'
  click_link "Sign In"
  fill_in "user_username", with: "Test"
  fill_in "user_password", with: "test"
  click_button "Log In"
end


it "creates a new genre using a form" do
  #1. Go to genre index and find a button to "Add New Genre"
   visit genres_path
   #2. Click on the "Add New Genre" button
   click_button "Add New Genre"
   #3. Fill in the genre form inputs for title, author, and page count
   fill_in "genre_name", with: "Sci-fi"
   #4. Click on "Create Genre" button
   click_button "Create Genre"
   #5. Redirect to new genre show page
   #6. New genre show page should include name from input form
   expect(page).to have_content("Sci-fi")
 end


end
