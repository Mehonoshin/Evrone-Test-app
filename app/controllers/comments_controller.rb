class CommentsController < ApplicationController
  def create
    c = Comment.create(:user_id => current_user.id, :textbody => params[:textbody], :post_id => params[:post_id])
    redirect_to post_path(Post.find(params[:post_id]))
  end
end
