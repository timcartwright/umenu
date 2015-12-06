class OrderItemsController < ApplicationController

  respond_to :html, :js

  def create
    item = MenuItem.find(params[:item])
    restaurant = Restaurant.find(params[:restaurant])
    current_user.add_to_order(item, restaurant)
    redirect_to restaurant_path(restaurant)
  end

  def destroy
    
    item = OrderItem.find(params[:id])
    amount = item.price * item.quantity
    item.order.total_price -= amount
    item.order.save
    item.destroy

    redirect_to request.referrer
  end
end
