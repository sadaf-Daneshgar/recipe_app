class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])

    return unless @user.nil?

    redirect_to users_path
  end
end
