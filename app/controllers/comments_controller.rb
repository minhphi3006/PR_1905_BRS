class CommentsController < ApplicationController
  def new
    @comment = @post.comments.new
  end

  def create
    @post=Post.find_by_id(params[:post_id])
    @comment= @post.comments.new(comment_params)
    @comment.user_id= current_user.id
    respond_to do |format|
      if @comment.save
        format.js {}
        format.html { redirect_to posts_url }
        format.json {}
      end
    end
  end

  def destroy
    @post=Post.find_by_id(params[:post_id])
    @comment= @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {}
      format.html { redirect_to posts_url }
    end
  end

  def edit 
    @post=Post.find_by_id(params[:post_id])
    @comment= @post.comments.find(params[:id])
  end

  def update 
    @post = Post.find(params[:post_id])
    @comment= @post.comments.find(params[:id])
    @comment.update_attributes(comment_content_params)
    respond_to do |format|
      format.js{}
      format.html{ redirect_to index_path}
    end
  end

private
  def comment_params
    params.require(:comment).permit(:post_id, :content, :user_id)
  end

  def comment_content_params
    params.require(:comment).permit(:content)
  end
end
