class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
                        protected
                        def configure_permitted_parameters
                                devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre])
                                devise_parameter_sanitizer.permit(:account_update, keys: [:nombre])
                        end
                        def after_sign_in_path_for(resource)
                                welcome_path
                        end
end
