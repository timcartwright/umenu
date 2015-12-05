# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ActiveRecord::Base
  has_many :menucategories, class_name: MenuCategory.name
  has_many :orders, class_name: Order.name
  has_many :managerships, class_name: Manager.name, dependent: :destroy
  has_many :managers, through: :managerships, source: :user

  validates :name, presence: true
end