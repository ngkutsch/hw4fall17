class UsersController < ApplicationController
    
    def user_params
        params.require(:user).permit(:user_id, :email)
    end
    def new
    end
    
    def create 
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.user_id} was successfully created."
        redirect_to movies_path
    end
end