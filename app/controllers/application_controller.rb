class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  def set_current_user
    # We have added a user attribute to current.rb
    # https://api.rubyonrails.org/classes/ActiveSupport/CurrentAttributes.html
    # this is a way to store an object to be accessed in our views 
    # other controllers can read this action, they inherit from Application Controller

    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
  end 
end
