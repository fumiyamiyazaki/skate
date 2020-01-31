class UsersController < ApplicationController
  before_action :move_to_signup, only: [:edit, :create, :update, :following, :followers]


  def show
    @user = User.find(params[:id])
    @topics = @user.topics.all
  end


  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_following'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_followers'
  end

  private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :image)
  end

  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end

end
