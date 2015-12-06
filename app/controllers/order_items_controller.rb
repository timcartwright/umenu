class OrderItemsController < ApplicationController

  respond_to :html, :js

  def create
    item = MenuItem.find(params[:item])
    restaurant = Restaurant.find(params[:restaurant])
    @order_item = current_user.add_to_order(item, restaurant)
    @total_price = @order_item.order.total_price
  end

  def destroy
    
    @order_item = OrderItem.find(params[:id])
    amount = @order_item.price
    if @order_item.quantity == 1
      @order_item.destroy
    else
      @order_item.quantity -= 1
      @order_item.save
    end
    
    @order_item.order.total_price -= amount
    @total_price = @order_item.order.total_price
    @order_item.order.save


  end
end
