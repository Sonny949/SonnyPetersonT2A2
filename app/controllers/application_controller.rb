class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, address_attributes: [:address_first, :address_second, :state, :city, :postcode]])
  end

  private

  def forbidden
    flash[:alert] = "Oops! You're not authorised to perform this action!"
  end
end
