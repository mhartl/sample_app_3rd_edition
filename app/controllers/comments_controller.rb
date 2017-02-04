class CommentsController < ApplicationController

  def create
    Comment.create(create_params)
    redirect_to controller: :microposts, action: :show, id: params[:micropost_id]
  end

  def destroy
    @comment = Comment.find(params[:id])
  end

  def create_params
    params.require(:comment).permit(:content, :picture).merge(micropost_id: params[:micropost_id], user_id: current_user.id)
  end

end
