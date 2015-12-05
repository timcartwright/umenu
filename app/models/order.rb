class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :orderitems, class_name: OrderItem.name
end
