class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def show
    @posts = @user.posts
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to profile_path(@user)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to profile_path(@user)
  end

  def accept
    current_user.accept_follow_request_of(@user)
    redirect_to root_path
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to root_path
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to root_path
  end

  def followers
    p @user.followers
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
