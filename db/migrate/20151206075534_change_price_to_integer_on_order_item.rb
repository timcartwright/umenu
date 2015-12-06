class ChangePriceToIntegerOnOrderItem < ActiveRecord::Migration
  def up
    change_column :order_items, :price, :integer
  end

  def down
    change_column :order_items, :price, :decimal
  end
end
