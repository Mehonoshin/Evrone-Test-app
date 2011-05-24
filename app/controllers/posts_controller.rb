class PostsController < ApplicationController
  
  def index
    @postsList = Post.find(:all, :order => "created_at DESC")
  end
  
  def create
    if user_signed_in?
      p = Post.create(:title => params[:title], :textbody => params[:textbody])
    end
    redirect_to post_path(p)
  end
  
  def new
    # show form
  end
  
  def show
    @post = Post.find(params[:id])
  end
end