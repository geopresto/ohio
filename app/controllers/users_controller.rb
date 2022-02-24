# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update index]
  before_action :correct_user,   only: %i[edit update]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  # show the user's profile page
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save # save of the user is successful
      flash[:success] = 'Thanks for becoming a member!'
      redirect_to root_url
    else # handle an unccessful save
      flash[:danger] = 'Uh oh! Invalid information!'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      # store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
