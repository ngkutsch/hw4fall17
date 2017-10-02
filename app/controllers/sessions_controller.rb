class SessionsController < ApplicationController
    
    def session_params
        params.require(:user).permit(:user_id,:email)
    end
    
    def new
         # default: render 'new' template
    end
    
    def create 
        if User.find_by_user_id(session_params[:user_id]).blank?
            flash[:warning] = "No account was found matching this user-id."
            redirect_to login_path
        else
            if User.find_by_user_id(session_params[:user_id]).email != session_params[:email]
                flash[:warning] = "This email does not match the email for this user-id."
                redirect_to login_path
            else
                user = User.find_by_user_id(session_params[:user_id])
                session[:session_token] = user.session_token
                redirect_to movies_path
            end
        end
    end
    
    def destroy
        session.delete(:session_token)
        redirect_to movies_path
    end
end