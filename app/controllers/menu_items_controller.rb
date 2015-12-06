class MenuItemsController < ApplicationController

  def create  
    menu_category = MenuCategory.find_by(id: params[:menu_item][:menucategory], restaurant_id: params[:restaurant_id])
    menu_item = menu_category.menuitems.new(menu_item_params)

    if menu_item.save
      flash[:notice] = "Menu Item Created"
    else
      flash[:alert] = "Couldn't Create Item"
    end

    redirect_to edit_restaurant_path(params[:restaurant_id])
  end

  def update
    menu_item = MenuItem.find(params[:id])
    menu_item.name = params[:menu_item][:name]
    menu_item.description = params[:menu_item][:description]
    menu_item.price = params[:menu_item][:price]

    if menu_item.save
      flash[:notice] = "Menu Item Updated"
    else
      flash[:alert] = "Couldn't Update Item"
    end

    redirect_to edit_restaurant_path(params[:restaurant_id])
  end

private
  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price)
  end

end