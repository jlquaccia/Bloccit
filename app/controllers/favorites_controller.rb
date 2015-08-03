class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    authorize favorite

    if favorite.save
      flash[:notice] = "Favorite was saved."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error saving your favorite.  Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    authorize favorite

    if favorite.destroy
      flash[:notice] = "Post unfavorited successfully."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error unfavoriting this post."
      redirect_to [post.topic, post]
    end
  end
end
