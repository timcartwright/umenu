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

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
