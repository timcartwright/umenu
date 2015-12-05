class AddColumnToMenuItems < ActiveRecord::Migration
  def change
    add_reference :menu_items, :menu_category, index: true, foreign_key: true
  end
end
