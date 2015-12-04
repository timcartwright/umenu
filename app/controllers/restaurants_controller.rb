class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
    @menuitems = @restaurant.menuitems
    @menucategories = MenuCategory.all
    @menu_item = MenuItem.new
  end
  
end
