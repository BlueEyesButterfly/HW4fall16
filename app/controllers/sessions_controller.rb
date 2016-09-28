class SessionsController < ApplicationController


  def new
  end
  
  def create
    string= params[:session][:user_id]
    user = User.find_by(user_id: string)
    if user && (user.email==params[:session][:email])
      session[:session_token]=user.session_token
      set_current_user
      session[:notice] = "You are logged in as #{user.user_id}."
      redirect_to movies_path
    else
      # Create an error message.
      flash[:warning] = "Invalid user-id/email combination."
      redirect_to login_path
    end
  end

  def destroy
      session[:session_token]=nil
      redirect_to movies_path
  end
end
