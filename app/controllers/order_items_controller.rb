class OrderItemsController < ApplicationController

  respond_to :html, :js

  def create
    item = MenuItem.find(params[:item])
    restaurant = Restaurant.find(params[:restaurant])
    @order_item = current_user.add_to_order(item, restaurant)
    @order = @order_item.order
    @total_price = @order.total_price
    @quantity = @order_item.quantity
    @orderitems = @order.orderitems
  end

  def destroy
    
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    amount = @order_item.price
    if @order_item.quantity == 1
      @order_item.destroy
      @quantity = 0
    else
      @order_item.quantity -= 1
      @quantity = @order_item.quantity
      @order_item.save
    end


    
    @order_item.order.total_price -= amount
    @total_price = @order_item.order.total_price
    @order_item.order.save


  end
end
