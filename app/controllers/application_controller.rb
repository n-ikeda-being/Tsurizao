class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        keys = %i[email name avatar]
        devise_parameter_sanitizer.permit(:sign_up, keys: keys)
        devise_parameter_sanitizer.permit(:account_update, keys: keys)
        @users = User.with_attached_avatar.order(:id).page(params[:page])
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
