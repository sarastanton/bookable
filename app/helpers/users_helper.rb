module UsersHelper

  def pages_read_by_user(user)
    pages = 0
    Book.my_read_books(user).each do |book|
      pages += book.page_count
    end
    user.update(pages_read: pages)
    user.save
    user.pages_read
  end

end
