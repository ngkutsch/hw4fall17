class UsersController < ApplicationController
    
    def user_params
        params.require(:user).permit(:user_id, :email, :session_token)
    end
    def new
         render :template => 'users/new'
    end
    
    def create 
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.user_id} was successfully created."
        redirect_to users_path
    end
end