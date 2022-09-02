class CommentsController < ApplicationController
  def create
    @post = Post.includes(:user).find(params[:post_id])
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:success] = 'Comment created successfully'
      redirect_to user_post_path(current_user, @post)
    else
      flash.now[:error] = 'Error: Comment could not be created'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    flash[:success] = 'You have deleted your comment!!.'
    redirect_to user_post_path(current_user, params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
