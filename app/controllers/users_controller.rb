class UsersController < ApplicationController

 def show
  @user = User.find(params[:id])
  @images = @user.images.page(params[:page]).reverse_order
 end

 def index
  @books = Book.all
  @book = Book.new
  @users = User.all
  @user = current_user
 end

 def edit
  @user = User.find(params[:id])
  if @user.id == current_user.id
   render :edit
  else
   redirect_to user_path(current_user.id)
  end
 end

 def create
  user = User.new(user_params)
  user.save
  redirect_to '/top'
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   redirect_to user_path(@user.id), notice: 'successfully user profile update'
  else
   render :edit
  end
 end

 private

 def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
 end

end
