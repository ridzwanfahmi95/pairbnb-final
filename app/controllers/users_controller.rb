class UsersController < ApplicationController
#mx   
before_action :find_user, only: [:show, :edit, :update]
    
   def index
      @user = User.all
   end
   
   def show
      @user = User.find(params[:id])
   end

   def new
      @user = User.new
   end
  
  
   def create
      @user = User.new(user_params)
      
      if @user.save
         redirect_to users_path
      else
         
         render 'new'
      end
   end
     
   def edit
       @user = User.find(params[:id])
   end
   
   def update
      @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Successfully updated the user"
      redirect_to @user
    else
      flash[:danger] = "Error updating user"
      render :edit
    end
   end
   
   def find_user
    @user = User.find(params[:id])
   end



   private
   def user_params
      params.require(:user).permit(:username, :name, :email, :password, :image)
   end
    #image
    
end
