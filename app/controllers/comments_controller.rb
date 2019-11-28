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
      format.html { redirect_to post_path(@post)  }
      format.json { render json: @comment, status: created, location: @comment}
      end
    end
  end

  def destroy
    @post=Post.find_by_id(params[:post_id])
    @comment= @post.comments.find(params[:id])
    @comment.destroy

    redirect_to index_path
  end

  private
   def comment_params
    params.require(:comment).permit(:post_id, :content, :user_id)
   end
end
