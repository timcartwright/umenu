# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, class_name: Order.name
  has_many :managementjobs, class_name: Manager.name, dependent: :destroy
  has_many :restaurants, through: :managementjobs, source: :restaurant

  def current_order(restaurant)
    order = self.orders.find_by(paid: nil, restaurant: restaurant)
    if order.nil?
      order = self.orders.new
      order.total_price = 0
      order.restaurant = restaurant
      order.save!
    end

    return order
  end

  def add_to_order(menuitem, restaurant)
    order = current_order(restaurant)
    order.total_price += menuitem.price
    order.save!

    orderitem = order.orderitems.find_by(menu_item: menuitem)
    if orderitem.nil?
      orderitem = order.orderitems.new
      orderitem.menu_item = menuitem
      orderitem.price = menuitem.price
      orderitem.quantity = 1
    else
      orderitem.quantity += 1
    end

    orderitem.save!

    return orderitem

  end
end
