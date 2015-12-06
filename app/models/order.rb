# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  total_price   :decimal(, )
#  paid          :datetime
#  fulfilled     :datetime
#  user_id       :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :orderitems, class_name: OrderItem.name

  validates :total_price, presence: true,
                          numericality: true

  def mark_as_paid
    self.paid = Time.zone.now
    self.save
  end
  
  def mark_as_fulfilled
    self.fulfilled = Time.zone.now
    self.save
  end
end
