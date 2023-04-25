class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end

    # ログイン後
    def after_sign_in_path_for(_resource_or_scope)
        fishlists_path
    end

    # ログアウト後
    def after_sign_out_path_for(_resource_or_scope)
        new_user_session_path
    end
end
