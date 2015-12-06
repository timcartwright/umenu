class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    # Menu
    @restaurant = Restaurant.find(params[:id])
    @menucategories = @restaurant.menucategories.all
    @menu_item = MenuItem.new

    # Order
    if current_user
      @order = current_user.current_order(@restaurant)
      @orderitems = @order.orderitems
      @total_price = @order.total_price
    end

  end

  def edit
    # Menu
    @restaurant = Restaurant.find(params[:id])
    @menucategories = @restaurant.menucategories.all
    @menu_item = MenuItem.new

    # Category
    @category = MenuCategory.new
    
  end

private

  
end