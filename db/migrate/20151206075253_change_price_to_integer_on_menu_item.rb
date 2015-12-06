class ChangePriceToIntegerOnMenuItem < ActiveRecord::Migration
  def up
    change_column :menu_items, :price, :integer
  end

  def down
    change_column :menu_items, :price, :decimal
  end
end
