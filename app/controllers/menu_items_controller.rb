class MenuItemsController < ApplicationController

  def create
    
    menu_category = MenuCategory.find_by(id: params[:menu_item][:menucategory], restaurant_id: params[:restaurant_id])
    menu_item = menu_category.menuitems.new(menu_item_params)

    if menu_item.save
      flash[:notice] = "Menu Item Created"
    else
      flash[:alert] = "Couldn't Create Item"
    end

    redirect_to restaurant_path(params[:restaurant_id])
    
  end

private
  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price)
  end

end