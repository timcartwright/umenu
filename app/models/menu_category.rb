# == Schema Information
#
# Table name: menu_categories
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#

class MenuCategory < ActiveRecord::Base
  has_many :menuitems, class_name: MenuItem.name
  belongs_to :restaurant

  validates :name, presence: true
end