class WishlistsController < ApplicationController

  def index
    @wishlists = Wishlist.all
    @wishlists_day_count = @wishlists.map {
      |wishlist| { wishlist: wishlist, day_count: (wishlist.due_date - Date.today).to_i }
    }
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = current_user.wishlists.new(list_params)
    if @wishlist.save 
      redirect_to wishlists_path
    end
  end

  private

  def list_params
    params.require(:wishlist).permit(:list, :due_date)
  end
end

