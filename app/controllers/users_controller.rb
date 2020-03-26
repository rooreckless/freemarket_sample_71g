class UsersController < ApplicationController
  before_action :move_index, only: [:index]

  def index
  end

  def show 
  end

  private
    def move_index
        redirect_to controller: :products, action: :index
      unless current_user.id == @product.saler.id
      end
    end
  end