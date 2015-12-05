class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menuitems = @restaurant.menuitems
    @menucategories = MenuCategory.all
    @menu_item = MenuItem.new
  end
  
end
