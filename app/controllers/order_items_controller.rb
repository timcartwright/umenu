class OrderItemsController < ApplicationController

  respond_to :html, :js

  def create
    item = MenuItem.find(params[:item])
    restaurant = Restaurant.find(params[:restaurant])
    @order_item = current_user.add_to_order(item, restaurant)
    @total_price = @order_item.order.total_price
  end

  def destroy
    
    item = OrderItem.find(params[:id])
    amount = item.price
    if item.quantity == 1
      item.destroy
    else
      item.quantity -= 1
      item.save
    end
    
    item.order.total_price -= amount
    item.order.save

    redirect_to request.referrer
  end
end
