class AddRestaurantToMenuCategories < ActiveRecord::Migration
  def change
    add_reference :menu_categories, :restaurant, index: true, foreign_key: true
  end
end
