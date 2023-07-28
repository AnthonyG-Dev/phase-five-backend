class UsersController < ApplicationController
  # Action to show a list of all users
  def index
    @users = User.all
  end

  # Action to display a specific user's details
  def show
    @user = User.find(params[:id])
  end

  # Action to render a form for creating a new user
  def new
    @user = User.new
  end

  # Action to handle the creation of a new user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # Action to render a form for editing a user's details
  def edit
    @user = User.find(params[:id])
  end

  # Action to handle updating a user's details
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # Action to handle deleting a user
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'User was successfully deleted.'
  end

  private

  # Strong parameters to whitelist user attributes for security
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
