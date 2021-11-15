class LikesController < ApplicationController
  before_action :get_post
  before_action :find_like, only: [:destroy]

  def create
    @post.likes.create(user_id: session[:user_id])
    redirect_to root_path
  end

  def destroy
    @like.destroy
    redirect_to root_path
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
