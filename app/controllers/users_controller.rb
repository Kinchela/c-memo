class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  #helpers
  #user_signed_in?  --to verify if a user is signed in
  #current_user  --for the current signed-in user
  #user_session  --you can access the session for this scope
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  # def new
  # end

  # def destroy
  #   User.find(params[:id]).destroy
  #   flash[:success] = "User deleted"
  #   redirect_to users_url, status: :see_other
  # end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end
end