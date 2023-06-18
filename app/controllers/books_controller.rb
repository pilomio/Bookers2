class BooksController < ApplicationController

 before_action :authorize_user, only: [:edit, :update, :destroy]


 def show
      @book = Book.new
      @book_detail = Book.find(params[:id])
      @books = Book.all
      @user = @book_detail.user
    
 if params[:from_other_user]
      @books = @books.where.not(user: current_user)
 else
      @books = @books.where(user: current_user)
 end
 end

  def new
    @book = Book.new

  end

  def create
    @books = Book.all
   @book = Book.new(book_params)
   if current_user
    @book.user_id = current_user.id
   end
   if @book.save
     flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book)
   else
   render :new
   end
  end

  def index
    
    @books = Book.all
  
  end


  def edit
    @book = Book.find(params[:id])
    @user = current_user
    if @user != @book.user
      redirect_to books_path
    end
    
  end


def update
   @book = Book.find(params[:id])
   if current_user
    @book.user_id = current_user.id
   end
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
    redirect_to book_path(@book)
    else
     render 'edit'
    end
end

  def destroy
    @book = Book.find(params[:id])
   @book.destroy
     redirect_to books_path
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

   def authorize_user
    @book = Book.find(params[:id])
    unless current_user == @book.user
      flash[:error] = "You are not authorized to perform this action."
      redirect_to root_path
    end
   end

end

