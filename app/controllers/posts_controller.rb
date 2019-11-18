class PostsController < ApplicationController
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
  end

  def new
    @post = Post.new
  end

  def index
    @posts = Post.posts_on_timeline(current_user.list_of_followed_by_user, current_user)
  end

  private
  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end
end

