# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: %i[edit update destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path(@book), notice: '新しく投稿しました。'
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @following_users = current_user.followings # [2,3]
    @timeline_books = Book.where(user_id: @following_users.ids)
    @user = current_user
    @all_ranks = Book.find(Favorite.group(:book_id).order('count(book_id) desc').limit(3).pluck(:book_id))
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
    @book_comment = BookComment.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless @book.user_id == current_user.id
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book), notice: '正常に更新しました。'
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id, :evaluation)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    redirect_to books_path unless @book.user == current_user
  end
end
