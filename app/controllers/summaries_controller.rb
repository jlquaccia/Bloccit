class SummariesController < ApplicationController
  def show
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def new
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:body)) # Unsure of this line
    @summary.post = @post

    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@post, @summary]
    else
      flash[:error] = "There was an error saving the summary.  Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])

    if summary.update_attributes(params.require(:summary).permit(:title, :body)) # Unsure of this line
      flash[:notice] = "Summary was updated."
      redirect_to [@post, @summary]
    else
      flash[:error] = "There was an error saving the summary.  Please try again."
      render :new
    end
  end
end
