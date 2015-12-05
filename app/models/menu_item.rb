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

  validates :name,            presence: :true
  validates :description,     presence: :true
  validates :price,           presence: :true,
                              numericality: {greater_than: 0}
end
