class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    # @posts = Post.all
    @post = Post.new
    comments = params.fetch(:comments, nil)
    @posts = Post.with_comments(comments).all
  end

  # GET /posts/1 or /posts/1.json

  def show
    @comments = Comment.where("post_id = #{@post.id}")
  end

  # GET /posts/1/edit
  def edit
    if Current.user != @post.user
      redirect_to root_path
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
   
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        # format.js { render inline: 'location.reload();' }
      else
        format.html { redirect_to root_path, notice: 'Please enter a valid message.' }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { redirect_to post_path, notice: 'Please enter a valid message.' }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:message, :likes_count, :video_url, pictures: [])
  end
end
