class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def send_invitation(user_id, current_user_id)
    puts params
    puts params
    puts 'id lone '
    user = User.find_by_id(user_id)
    current_user = User.find_by_id(current_user_id)
    current_user.send_invitation(user)
  end
  helper_method :send_invitation
end
