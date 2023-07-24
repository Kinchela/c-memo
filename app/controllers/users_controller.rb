class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  # before_action :user_signed_in?, only: [:index, :show, :edit, :update, :destroy]
  before_action :admin_user,         only: :destroy

  #helpers
  #user_signed_in?  --to verify if a user is signed in
  #current_user  --for the current signed-in user
  #user_session  --you can access the session for this scope
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url, status: :see_other
  end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url, status: :see_other) unless current_user.admin?
    end
end