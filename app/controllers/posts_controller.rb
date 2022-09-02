class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
  end

  def show
    @post = Post.includes(:user).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.includes(:user).find(params[:id])
    @user = User.find(@post.user_id)
    @user.posts_counter -= 1
    @user.save
    @post.destroy
    flash[:success] = 'You have deleted your Post!!.'
    redirect_to user_posts_path(current_user)
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_post_path(current_user, @post)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
