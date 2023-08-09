require_relative '../../lib/tasks/json_web_token.rb'

class AuthenticationController < ApplicationController
#   before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)

      # Set the JWT as an HTTP-only cookie in the response
      cookies.signed[:jwt_token] = {
        value: token,
        httponly: true,
        expires: 1000.hours.from_now
      }

      render json: { name: @user.name, id: @user.id, course_id: @user.course_id, avatar: @user.avatar, role: @user.role }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end  
end