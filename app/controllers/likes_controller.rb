class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:alert] = "You already liked this post"
    else
      redirect_to like_path(@like)
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to like_path(@like)
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
