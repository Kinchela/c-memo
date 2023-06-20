class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:action]

  #helpers
  #user_signed_in?  --to verify if a user is signed in
  #current_user  --for the current signed-in user
  #user_session  --you can access the session for this scope
  
  def new
  end
end