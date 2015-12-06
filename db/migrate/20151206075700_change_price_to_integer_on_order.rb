class ChangePriceToIntegerOnOrder < ActiveRecord::Migration
  def up
    change_column :orders, :total_price, :integer
  end

  def down
    change_column :orders, :total_price, :decimal
  end
end
