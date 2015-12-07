class RestaurantsController < ApplicationController

  before_action :auth, only: [:edit]

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
    @restaurant = Restaurant.find(params[:id])
 
    # Menu
    @menucategories = @restaurant.menucategories.all
    @menu_item = MenuItem.new

    # Category
    @category = MenuCategory.new
    
    
  end

private

  def auth
    @restaurant = Restaurant.find(params[:id])
    if !Manager.where(user_id: current_user.id).where(restaurant_id: @restaurant.id).any?
      flash[:alert] = 'You are not authoroised to manage this restaurant'
      redirect_to @restaurant
    end
    
  end
  
end