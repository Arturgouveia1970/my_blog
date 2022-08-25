class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
