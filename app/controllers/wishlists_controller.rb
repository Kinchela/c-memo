class WishlistsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create, :destroy]
  before_action :correct_user,    only: :destroy

  def index
    if user_signed_in?
      @wishlists = current_user.wishlists.all
      @wishlists_day_count = @wishlists.map do |wishlist| 

        day_count = (wishlist.due_date - Date.today).to_i
        { wishlist: wishlist, day_count: day_count }
      end
    end
  end

  def new
    @wishlist = current_user.wishlists.build
  end

  def create
    @wishlist = current_user.wishlists.build(list_params)
    if @wishlist.save 
      redirect_to wishlists_path
    end
  end

  def destroy
    @wishlist.destroy
    flash[:success] = "Wishlist deleted"
    redirect_to wishlists_path, status: :see_other
  end

  private

  def list_params
    params.require(:wishlist).permit(:id, :list, :due_date)
  end

  def correct_user
    @wishlist = current_user.wishlists.find_by(id: params[:id])
    redirect_to wishlists_path, status: :see_other if @wishlist.nil?
  end
end
