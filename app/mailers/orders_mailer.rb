class OrdersMailer < ApplicationMailer

  def receipt_email(order_id)
    @order = Order.find_order_with_items(order_id)
    mail(to: @order.email, subject: "Jungle Order Confirmation ##{@order.id}")
  end

end
