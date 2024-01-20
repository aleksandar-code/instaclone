class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    p friend
    friend = @user

    skip_authorization and render status: :not_found and return unless friend

    authorize friend

    current_user.friends << friend
    friend.friends << current_user

    if current_user.save! && friend.save!
      render json: current_user, status: :ok
    else
      render status: :bad_request
    end
  end

end
