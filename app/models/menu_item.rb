# == Schema Information
#
# Table name: menu_items
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  price            :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  menu_category_id :integer
#

class MenuItem < ActiveRecord::Base
  belongs_to :menucategory
  has_many :orderitems, class_name: OrderItem.name

  validates :name,            presence: true
  validates :description,     presence: true
  validates :price,           presence: true,
                              numericality: true
end
