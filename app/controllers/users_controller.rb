class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id]) 
  end

  require 'payjp'

  def purchase
    Payjp.api_key = "sk_test_a1e32f13f3b2adc61a44ad06"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end

end
