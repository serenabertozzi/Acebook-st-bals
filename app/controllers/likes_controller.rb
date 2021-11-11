class LikesController < ApplicationController
  before_action :get_post
  before_action :find_like, only: [:destroy]
  
  def create
    if !already_liked?
      @post.likes.create(user_id: session[:user_id])
      redirect_to post_path(@post)
    else
      destroy
    end
  end

  def destroy
    @like.destroy
    redirect_to post_path(@post)
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: session[:user_id], post_id:params[:post_id]).exists?
  end

  def find_like
    @like = @post.likes.find(params[:id])
 end
end
