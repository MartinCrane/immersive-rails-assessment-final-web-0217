class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.valid?
      user.save
      session[:user_id]=user.id
      redirect_to episodes_path
    else
      flash[:error]=account.errors.full_messages[0]
      redirect_to register_path
    end

  end



  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
