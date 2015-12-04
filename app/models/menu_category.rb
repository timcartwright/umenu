# == Schema Information
#
# Table name: menu_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MenuCategory < ActiveRecord::Base
  belongs_to :restaurant
  has_many :menuitems
end
