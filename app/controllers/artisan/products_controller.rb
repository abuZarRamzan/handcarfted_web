class Artisan::ProductsController < ApplicationController
  before_action :ensure_artisan

  def index
    @products = current_user.products
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to artisan_products_path
    else
      render :new
    end
  end

  def edit
    @product = current_user.products.find_by(id: params[:id])
  end

  def update
   @product = current_user.products.find_by(id: params[:id])
    if @product.update(product_params)
      redirect_to artisan_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = current_user.products.find_by(id: params[:id])
    @product.destroy
    redirect_to artisan_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo, :category_list)
  end
  
  def ensure_artisan
    redirect_to root_path, alert: "Access denied" unless current_user.artisan?
  end
end
