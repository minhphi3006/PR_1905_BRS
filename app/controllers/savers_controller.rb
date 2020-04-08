class SaversController < ApplicationController
  before_action :find_post_saver
  before_action :saver_active, only: [:destroy]

  def create
    unless current_user.saver?(@post)
      @saver = @post.savers.create user_id: current_user.id
      flash[:success]= "Save Post Successful"
    end
  end
  
  def destroy
    @saver.destroy
  end

  def index
    @savers = Saver.all
  end

private
  def find_post_saver
    @i = params[:i]
    @post = Post.find(params[:post_id])
  end

  def saver_active
    @post = Post.find(params[:post_id])
    @saver = @post.savers.find(params[:id])
  end 
end
