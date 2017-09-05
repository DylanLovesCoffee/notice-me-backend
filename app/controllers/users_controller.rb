class UsersController < ApplicationController
  # Handles user signup
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { user_id: @user.id, status: 200 }
    else
      render json: { error: @user.errors.full_messages, status: 420 }
    end
  end

  def show
    authenticate_request!
    if @current_user
      render json: { notes: @current_user.notes }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
