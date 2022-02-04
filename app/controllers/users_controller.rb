class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def show #show the user's profile page
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save #save of the user is successful
      flash[:success] = "Thanks for becoming a member!"
      redirect_to root_url
    else #handle an unccessful save
      flash[:danger] = "Uh oh! Invalid information!"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end


  private 

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
end
