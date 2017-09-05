class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user_id: @user.id, status: 200 }
    else
      render json: { error: @user.errors, status: 420 }
    end
  end

  def show
    # If current authorization key is an existing user, display all the particular user's notes
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end