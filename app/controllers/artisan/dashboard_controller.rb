class Artisan::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_artisan!

  def index
    @shop = current_user
  end
  
  private

  def ensure_artisan!
    redirect_to root_path, alert: "Access denied." unless current_user.artisan?
  end
end
