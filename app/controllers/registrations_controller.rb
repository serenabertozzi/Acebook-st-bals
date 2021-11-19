class RegistrationsController < ApplicationController
  def new
    if Current.user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'You successfully created an Acebook account'
    else
      flash.now[:alert] = 'Registration failed.'
      render :new
    end
  end

  private

  def user_params
    # https://api.rubyonrails.org/v6.1.4/classes/ActionController/Parameters.html#method-i-permit
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :profile_photo)
  end
end
