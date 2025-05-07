# app/controllers/artisan/registrations_controller.rb
class Artisan::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication_with_signout, only: [:new, :create]
  before_action :configure_permitted_parameters, only: [:create]

  def new
    build_resource({})
    resource.role = :artisan
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    resource.role = :artisan

    if resource.save
      sign_up(resource_name, resource)
      redirect_to artisan_root_path
    else
      render :new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:shop_name, :shop_description, :shop_address])
  end

  def require_no_authentication_with_signout
    if user_signed_in?
      sign_out(:user)
    end
  end
end
