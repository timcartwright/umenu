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

require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
