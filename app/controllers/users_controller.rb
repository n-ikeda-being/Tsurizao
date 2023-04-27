class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
  end
end
