class PostsController < ApplicationController
  
  def index
    @postsList = Post.paginate :page => params[:page], :order => 'created_at DESC'
  end
  
  def create
    if user_signed_in?
      p = Post.create(:title => params[:title], :textbody => params[:textbody], :user_id => current_user.id)
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
  
  def update
    post = Post.find(params[:id])
    if (current_user.id == post.user_id)    
      post.title = params[:post][:title]
      post.textbody = params[:post][:textbody]
      post.save
    end
    redirect_to post_path(post)
  end
  
  def edit
    @post = Post.find(params[:id])
    render :action => "new"
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id      
      post.destroy
    end
    redirect_to root_path
  end
  
end