class FavoritesController < ApplicationController

    def create
        @fishlist_favorite = Favorite.new(user_id: current_user.id, fishlist_id: params[:fishlist_id])
        @fishlist_favorite.save
        redirect_to fishlist_path(params[:fishlist_id])
    end

    def destroy
        @fishlist_favorite = Favorite.find_by(user_id: current_user.id, fishlist_id: params[:fishlist_id])
        @fishlist_favorite.destroy
        redirect_to fishlist_path(params[:fishlist_id])
    end
end
