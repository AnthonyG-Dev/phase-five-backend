class UsersController < ApplicationController
  # before_action :authorize_request, except: :create
  # Action to show a list of all users
  def index
    @users = User.all
    render json: @users
  end

  # Action to display a specific user's details
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # Action to render a form for creating a new user
  def new
    @user = User.new
    render json: @user
  end

  # Action to handle the creation of a new user
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # Action to render a form for editing a user's details
  def edit
    @user = User.find(params[:id])
    render json: @user
  end

  # Action to handle updating a user's details
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # Action to handle deleting a user
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  # Strong parameters to whitelist user attributes for security
  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :role, :course_id)
  end
end
