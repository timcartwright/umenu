class OrderItemsController < ApplicationController

  def create
    item = MenuItem.find(params[:item])
    restaurant = Restaurant.find(params[:restaurant])
    current_user.add_to_order(item, restaurant)
    redirect_to restaurant_path(restaurant)
  end
end
