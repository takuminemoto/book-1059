class BooksController < ApplicationController

 def new
  @book = Book.new
 end

 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
     redirect_to book_path(@book), notice: 'successfully new posting'
  else
    @books = Book.all
    @user = current_user
    render :index
  end
 end

 def index
  @book = Book.new
  @books = Book.all
  @user = current_user
 end

 def show
  @book = Book.find(params[:id])
  @user = @book.user
  @book_new = Book.new
 end

 def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
 end

 def edit
  @book = Book.find(params[:id])
  unless @book.user_id == current_user.id
   redirect_to books_path
  end
 end

 def update
  @book = Book.find(params[:id])
  @book.update(book_params)
  if @book.save
   redirect_to book_path(@book), notice: 'post update successfully'
  else
   @books = Book.all
   @user = current_user
   render :index
  end
 end

 private

 def book_params
  params.require(:book).permit(:title, :body, :user_id)
 end

end
