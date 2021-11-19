class SessionsController < ApplicationController
  def new
    if Current.user
      redirect_to root_path
    end
  end

  def create
    # search for a user by email params
    user = User.find_by(email: params[:email])
    # if they exist and password is correct, log them in. else fail message.
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Well done. You logged in. U smart. P.S. we now have your data."
    else
      flash.now[:alert] = "U done goofed. Maybe time to reset your password."
      render :new
    end
  end

  def destroy
    # end a user session
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been successfully logged out"
  end
end