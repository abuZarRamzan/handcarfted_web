class Artisan::AccountsController < ApplicationController
  before_action :ensure_artisan

  def edit
    @artisan = current_user
  end
  
  def update
    @artisan = current_user
    if @artisan.update(artisan_params)
      redirect_to artisan_root_path
    else
      render :edit
    end
  end

  private

  def artisan_params
    params.require(:user).permit(:shop_name, :shop_description, :shop_address)
  end

  def ensure_artisan
    redirect_to root_path, alert: "Access denied" unless current_user.artisan?
  end
end
