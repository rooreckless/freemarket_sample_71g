class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id]) 
    @user = User.where(user_id: current_user.id)
  end
end
