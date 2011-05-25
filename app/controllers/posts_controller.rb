class PostsController < ApplicationController
  
  def index
    @postsList = Post.paginate :page => params[:page], :order => 'created_at DESC'
    @tags = Post.tag_counts_on(:tags)
  end
  
  def create
    if user_signed_in?
      p = Post.create(:title => params[:post][:title], :textbody => params[:post][:textbody], :user_id => current_user.id, :tag_list => params[:post][:tag_list])
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
    @comments = Comment.where(:post_id => params[:id]).order("created_at DESC")
  end
  
  def update
    post = Post.find(params[:id])
    if (current_user.id == post.user_id)    
      post.title = params[:post][:title]
      post.textbody = params[:post][:textbody]
      post.tag_list = params[:post][:tag_list]
      post.save
    end
    redirect_to post_path(post)
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id      
      post.destroy
    end
    redirect_to root_path
  end
  
  def tag 
    @posts = Post.tagged_with(params[:name])
    @tagName = params[:name]
  end
  
end