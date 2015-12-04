class MenuItemsController < ApplicationController

  def create
    
    menu_item = MenuItem.new(menu_item_params)
    menu_item.restaurant_id = params[:restaurant_id]


    if menu_item.save
      flash[:notice] = "Menu Item Created"
    else
      flash[:alert] = "Couldn't Create Item"
    end

    redirect_to restaurant_path(params[:restaurant_id])
    
  end

private
  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :menucategory_id)
  end

end