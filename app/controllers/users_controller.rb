class UsersController < ApplicationController
  def new
  end

  def create
    new_user = User.create(user_params)
    if new_user.save 
      session[:user_id] = new_user.id 
      redirect_to '/'
    else 
      redirect_to '/signup'
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
