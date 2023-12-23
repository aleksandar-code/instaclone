class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show ]

  def index
    @users = User.all
  end

  def show

  end
end
