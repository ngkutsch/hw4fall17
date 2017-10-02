class UsersController < ApplicationController
    
    def user_params
        params.require(:user).permit(:user_id,:email)
    end
    
    def new
         # default: render 'new' template
    end
    
    def create 
        if User.find_by_user_id(user_params[:user_id]).blank?
            @user = User.create_user!(user_params)
            flash[:notice] = "#{@user.user_id} was successfully created."
        else
            flash[:warning] = "Sorry, this user-id is taken. Try again."
        end
        redirect_to login_path
    end
end