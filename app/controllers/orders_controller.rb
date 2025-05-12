class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders.includes(order_items: :product)
  end
  def new
    @cart = current_user.cart
  end
  def create
    cart = current_user.cart
    order = current_user.orders.create(total_price: cart.cart_items.sum { |item| item.quantity * item.product.price })

    cart.cart_items.each do |item|
      order.order_items.create(
        product: item.product,
        quantity: item.quantity,
        price: item.product.price
      )
    end

    cart.cart_items.destroy_all

    redirect_to order_path(order)
  end
  def show
    @order = Order.find(params[:id])
  end

end
