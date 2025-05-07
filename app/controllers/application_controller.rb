class ApplicationController < ActionController::Base

  protected

  def after_sign_up_path_for(resource)
    case resource.role
    when "admin"
      admin_root_path
    when "artisan"
      artisan_root_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    case resource.role
    when "admin"
      admin_root_path
    when "artisan"
      artisan_root_path
    else
      root_path
    end
  end
end
