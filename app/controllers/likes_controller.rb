class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @like= @post.likes.create user_id: current_user.id
  end

  def destroy
    @like.destroy
  end

  private
  def find_post
    @i= params[:i]
    @post = Post.find(params[:post_id])
    @posts = Post.posts_on_timeline(current_user.list_of_followed_by_user, current_user)
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
