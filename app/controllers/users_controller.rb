class UsersController < Clearance::UsersController
    
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
   end
   
   def update
   end


   private
   def user_params
      params.require(:user).permit(:username, :name, :email, :password)
   end
    
end
