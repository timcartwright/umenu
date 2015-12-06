class ChangeDescriptionFormatInMenuItems < ActiveRecord::Migration
  def up
    change_column :menu_items, :description, :string
  end

  def down
    change_column :menu_items, :description, :text
  end
end
