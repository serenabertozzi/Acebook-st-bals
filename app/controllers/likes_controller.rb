class LikesController < ApplicationController
# before_action :get_post

  # POST /posts or /posts.json
  def create
    @like = Like.new({params[:post_id]})
    @like.save
    format.js { render inline: "location.reload();" }
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @like.destroy
    format.js { render inline: "location.reload();" }
  end

  def count
    #Like.where(post_id matches post_id)
  end

  private

  # def get_post
  #   @post = Post.where("id = #{params[:post_id]}")
  # end
end
