class PostsController < ApplicationController

# Assignment 39 //////////////////////////////

  def index
    @posts = policy_scope(Post)
  end

  # /////////////////////////////////////////

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    # @post = Post.new(post_params) # THIS LINE RESULTS IN AN ERROR: SAYS "USER CAN'T BE BLANK"
    @post = current_user.posts.build(params.require(:post).permit(:title, :body)) # THIS LINE FIXES THE BUG CAUSED BY LINE 16
    @post.topic = @topic
    @post = Post.new(params.require(:post).permit(:title, :body, :published))
    @post.user = current_user
    authorize @post

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post.  Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(post_params)
    # if @post.update_attributes(params.require(:post).permit(:title, :body, :published))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post.  Please try again."
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :published)
  end
end
