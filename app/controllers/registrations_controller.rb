class RegistrationsController < ApplicationController
  

def create
   @user = User.new(book_params)
   if @user.save
     flash[:notice] = "Used successfully created"
   redirect_to books_path
   else
   render :new
   end
end
 

  
  
  private

def user_params
params.require(:user).permit(:name, :email, :password, :password_confirmation)
end


end