class LikesController < ApplicationController
  before_action :get_post

  # POST /posts or /posts.json
  def create
    @post.likes.create(user_id: "1")
    # Once session is implemented, change user_id argument to "current_user.id"
    redirect_to post_path(@post)
  end

  # # DELETE /posts/1 or /posts/1.json
  # def destroy
  #   @like.destroy
  #   format.js { render inline: "location.reload();" }
  # end

  # def count
  #   #Like.where(post_id matches post_id)
  # end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end
end
