class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
     @user = User.new
  end

  def create
     @user = User.new(user_params)
     if @user.save
       redirect_to @user
    else
      byebug
    end
   end

   def update
     @user = User.find(params[:id])
     @user.update(user_params)
     if @user.save
       redirect_to @user
    else
      byebug
    end
   end


   private

      def user_params
         params.require(:user).
            permit(:name, :email)
      end
end
