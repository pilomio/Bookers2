class UsersController < ApplicationController
  
  before_action :redirect_user, only: [:edit, :update]

  def show
    @user  = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
   @user = User.find(params[:id])
   
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile successfully updated."
    redirect_to user_path(@user)
    else
    render 'edit'
    end
  end



def index
  @users = User.all
end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
   def redirect_user
  redirect_to user_path(current_user.id) if current_user.id != User.find(params[:id]).id
   end
    
end
