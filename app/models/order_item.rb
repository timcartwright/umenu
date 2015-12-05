# == Schema Information
#
# Table name: order_items
#
#  id           :integer          not null, primary key
#  price        :decimal(, )
#  quantity     :integer
#  request      :string
#  order_id     :integer
#  menu_item_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  validates :quantity,  presence: true,
                        numericality: true
  validates :price,     presence: true,
                        numericality: true
end
