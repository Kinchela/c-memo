class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  #helpers
  #user_signed_in?  --to verify if a user is signed in
  #current_user  --for the current signed-in user
  #user_session  --you can access the session for this scope
  
  def show
    # @user = User.find(params[:id])  # Is this unnecessacry including user view as I deleted user profile?
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  # private
  #   def correct_user
  #     @user = User.find(params[:id])
  #     redirect_to(root_url, status: :see_other) unless current_user?(@user)
  #   end
end