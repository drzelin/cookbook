class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameteres, if: :devise_controller?

  private

  def configure_permitted_parameteres
    added_attrs =
      %i[email first_name last_name password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
