class SessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      render json: { token: @user, status: 200 }
    elsif @user
      render json: { error: @user.errors.full_messages, status: 403 }
    else
      render json: { error: "This user doesn't exist.", status: 403 }
    end
  end

  def logout
  end
end
