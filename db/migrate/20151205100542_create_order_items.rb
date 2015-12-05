class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal :price
      t.integer :quantity
      t.string :request
      t.references :order, index: true, foreign_key: true
      t.references :menu_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
