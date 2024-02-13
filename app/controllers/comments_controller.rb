class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.user_name = current_user.name
        if @comment.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            redirect_back(fallback_location: root_path, notice: 'コメントを削除しました')
        else
            flash.now[:alert] = 'コメント削除に失敗しました'
            redirect_back(fallback_location: root_path)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:comment_content).merge(user_id: current_user.id, fishlist_id: params[:fishlist_id])
    end

end