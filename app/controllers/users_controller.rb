class UsersController < ApplicationController
  def user_params
      params.require(:user).permit(:user_id,:email, :session_token)
  end
  
  def new
  end
  
  def create
    user_has=user_params
    @user= User.create_user!(user_has)
    if @user.save
      flash[:notice] = "Welcome #{@user.user_id}. Your account has been created"
      redirect_to login_path
    else
      string_warning='' 
      @user.errors.full_messages.each do |msg|
        if msg=="User has already been taken"
          msg="Sorry, this user id is taken. Try again"
        else
        end
        string_warning+=msg+"; "
      end
      flash[:warning] = string_warning
      redirect_to new_user_path
    end  
  end
  
  def index
    @users=User.all
  end
  
  def show
    @user=User.find(params[:id])
  
  end
  
end
