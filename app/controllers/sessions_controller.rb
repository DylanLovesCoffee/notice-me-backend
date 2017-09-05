require 'jsonwebtoken'

class SessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: @user.id})
      render json: { token: auth_token, status: 200 }
    elsif @user
      render json: { error: "Invalid username or password.", status: 420 }
    else
      render json: { error: "This user doesn't exist.", status: 403 }
    end
  end

  def logout
  end
end
