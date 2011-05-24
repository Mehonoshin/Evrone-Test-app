class PostsController < ApplicationController
  
  def index
    @postsList = Post.paginate :page => params[:page], :order => 'created_at DESC'
  end
  
  def create
    if user_signed_in?
      p = Post.create(:title => params[:title], :textbody => params[:textbody])
      redirect_to post_path(p)
    else
      redirect_to root_path
    end
    
  end
  
  def new
    if not user_signed_in?
      redirect_to root_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
end