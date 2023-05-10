class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page]).per(10)
    @q = User.ransack(params[:q])
    @user = @q.result
  end

  def show
    @user = User.find(params[:id])
    @fishlists = @user.fishlists.page(params[:page]).per(9).order('updated_at DESC')
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings.order(:id).page(params[:page])
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers.order(:id).page(params[:page])
  end

end
