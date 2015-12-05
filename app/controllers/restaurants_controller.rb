class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menucategories = @restaurant.menucategories.all
    @menu_item = MenuItem.new
  end

private

  
end