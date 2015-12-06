class MenuCategoriesController < ApplicationController

  def create
    debugger
    category = MenuCategory.new
    category.name = params[:menu_category][:name]
    category.restaurant_id = params[:restaurant_id]

    if category.save
      flash[:notice] = "Category Updated"
    else
      flash[:alert] = "Couldn't Update Category"
    end

    redirect_to edit_restaurant_path(category.restaurant)

  end

  def update

    category = MenuCategory.find(params[:id])
    category.name = params[:menu_category][:name]

    if category.save
      flash[:notice] = "Category Updated"
    else
      flash[:alert] = "Couldn't Update Category"
    end

    redirect_to edit_restaurant_path(category.restaurant)

  end
end