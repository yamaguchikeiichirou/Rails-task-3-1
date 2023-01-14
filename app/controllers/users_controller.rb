class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user),notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :introduction, :image)
  end
end
