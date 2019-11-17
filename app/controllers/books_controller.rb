class BooksController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_book, only: [:edit, :update]

def edit

    @book = Book.find(params[:id])


    if @book.user.id == current_user.id

      render action: :edit
    else

      redirect_to books_path(@books)

      end


  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    # book = Book.find(params[:id])
    # book.update(book_params)
  end
  end

  def create

      @book = Book.new(book_params)
      @book.user_id = current_user.id

      if @book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book.id)

      else
        @books = Book.all
        render :index
      end

  end


  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def index
    @book = Book.new
    @books = Book.all
    # @user = Book.find(params[:id])
  end

  def destroy
     @book = Book.find(params[:id])
      @book.destroy
         redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
