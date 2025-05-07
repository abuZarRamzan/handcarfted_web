class User::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :sign_out_current_user_if_any, only: [:new, :create]
  before_action :configure_permitted_parameters, only: [:create]

  def new
    build_resource({})
    resource.role = :buyer
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    resource.role = :buyer

    if resource.save
      sign_up(resource_name, resource)
      redirect_to root_path
    else
      clean_up_passwords(resource)
      render :new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [])
  end
  def sign_out_current_user_if_any
    if user_signed_in?
      sign_out(:user) 
    end
  end
end
