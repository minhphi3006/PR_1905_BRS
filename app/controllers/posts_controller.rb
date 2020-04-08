class PostsController < ApplicationController
  before_action :correct_user_id, only: [:edit, :update]
  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to index_path
    else
      flash[:danger] = "Post unsuccessfully created"
      redirect_to new_post_path
    end
  end

  def show
    @post=Post.find(params[:id])
    respond_to do |format|
        format.html { }
        format.json {render json: @post}
    end
  end

  def new
    @post = Post.new
  end

  def index
    @posts = Post.posts_on_timeline(current_user.list_of_followed_by_user, current_user)
  end
  
  def edit 
    @post=Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    @post.update_attributes(caption_params)
    respond_to do |format|
        format.js{}
        format.html{ redirect_to posts_url}
      end
  end  

  private
  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end

  def caption_params
    params.require(:post).permit(:caption)
  end

  def correct_user_id
    @post = Post.find(params[:id])
    @user = @post.user_id
    redirect_to(root_url) unless current_user_id?(@user)
  end
end 

