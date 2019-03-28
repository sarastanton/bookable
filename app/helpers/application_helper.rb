module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
    #session[:user_id] != nil
  end

  def require_login
    unless session.include? :user_id
      redirect_to '/'
      flash[:message] = "Must be signed in"
    end
  end

  def find_book_in_params
    if params[:book_id] != nil
      @book = Book.find(params[:book_id])
    elsif params[:id] != nil
      @book = Book.find(params[:id])
    end
  end

  def find_author_in_params
    if params[:author_id] != nil
      @author = Author.find(params[:author_id])
    elsif params[:id] != nil
      @author = Author.find(params[:id])
    end
  end

  def find_genre_in_params
    @genre = Genre.find(params[:id]) if params[:id] != nil
  end

  def find_user
    @user = current_user
  end

end
