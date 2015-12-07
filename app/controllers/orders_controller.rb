class OrdersController < ApplicationController

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @orders = @restaurant.orders.where(fulfilled: nil).where('total_price > ?', 0)
  end

  def show
    @order = Order.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    order = Order.find(params[:id])
    order.mark_as_fulfilled
    redirect_to restaurant_orders_path(params[:restaurant_id])
  end
end
