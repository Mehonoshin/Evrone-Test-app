class MainController < ApplicationController
  def index
    @postsList = Post.all
  end
  
  def post
    
  end
    
end