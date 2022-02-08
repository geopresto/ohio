class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to user
      # Log the user in and redirect to the user's show page.
    else
      flash[:danger] = "Aw man. Email/Password combo invalid!"
      render 'new'
    end
  end 

  def destroy
  end
end