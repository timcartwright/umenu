class ChargesController < ApplicationController
  
  def create

    
    amount = params[:order][:total_price].to_i * 100

    customer = Stripe::Customer.create(
      email:  params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       amount,
      description:  'Rails Test Customer from umenu',
      currency:     'gbp'
    )
    
    order_id = params[:order][:id]
    
    mark_order_as_paid(order_id)

    flash[:notice] = 'Yeah! Your order is on its way!'

    restaurant = params[:order][:restaurant_id]

    redirect_to restaurant_path(restaurant)

  rescue Stripe::CardError => e
    flash[:alert] = e.message

  end

private

  def mark_order_as_paid(order_id)
    order = Order.find(order_id)
    order.mark_as_paid
  end

end
