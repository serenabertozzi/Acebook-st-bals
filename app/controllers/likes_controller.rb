class LikesController < ApplicationController

  # GET /posts/new
  def new
    @like = Like.new
  end

  # POST /posts or /posts.json
  def create
    @like = Like.new(like_params)
    @like.save
    format.js { render inline: "location.reload();" }
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @like.destroy
    format.js { render inline: "location.reload();" }
  end
end
