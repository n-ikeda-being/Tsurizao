class FollowsController < ApplicationController
    # フォローする
    def create
        puts 'create action called' # デバッグ出力
        current_user.follow(params[:user_id])
        redirect_to user_path(params[:user_id])
    end

    # アンフォロー
    def destroy
        puts 'destroy action called' # デバッグ出力
        current_user.unfollow(params[:user_id])
        redirect_to user_path(params[:user_id])
    end

end