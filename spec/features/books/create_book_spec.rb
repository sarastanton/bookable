require 'rails_helper'

feature "Add A Book" do
  scenario "able to create a book" do
    #1. Go to book index and find a button to "Add New Book"
    visit books_path
    #2. Click on the "Add New Book" button
    click_button "Add New Book"
    #3. Fill in the book form inputs for title, author, and page count
    fill_in "book_title", with: "Harry Potter and the Sorcerer's Stone"
    fill_in "book_author_name", with: "J.K. Rowling"
    fill_in "book_genre_name", with: "Middle grade fantasy"
    fill_in "book_page_count", with: 320
    #4. Click on "Create Book" button
    click_button "Create Book"
    #5. Redirect to new book show page
    #6. New book show page should include title, author, and page count from input form
    expect(page).to have_content("Harry Potter and the Sorcerer's Stone")
    expect(page).to have_content("J.K. Rowling")
    expect(page).to have_content("Middle grade fantasy")
    expect(page).to have_content(320)
  end
end
