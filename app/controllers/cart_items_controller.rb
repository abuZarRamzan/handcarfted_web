class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = current_user.cart
    product = Product.find(params[:product_id])
    cart_item = cart.cart_items.find_or_initialize_by(product_id: product.id)
    cart_item.quantity ||= 0
    cart_item.quantity += params[:quantity].to_i
    cart_item.save
    redirect_to cart_path
  end

  def destroy
    cart_item = current_user.cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path
  end
end
