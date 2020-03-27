class PurchaseController < ApplicationController

  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    # params.require(:product_id)はviews/purchase/show.html.hamlの「form_with url: pay_purchase_index_path」のf.hiddenfieldからくる値=params.require(:product_id)=購入した商品のid
    # この「購入した商品のid」でテーブルを検索します。
    purchased_product=Product.find(params.require(:product_id))

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: purchased_product.price, #支払金額を入力（購入した商品を元に、テーブルの値をとってきます。）
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )

  #購入後のデータベース書き込み処理 
  
  # 検索結果の「購入した商品」のbuyer_idカラムの値を、「購入したときのcardのuser_id」でセットします。
  purchased_product.buyer_id=card.user_id
  # 「購入した商品」を更新するためsaveしますが、
  if purchased_product.save
    #saveに成功すれば、完了画面へ
    # redirect_to action: 'done' #完了画面に移動
    redirect_to product_path(params.require(:product_id)), notice: '購入完了しました。'
    # saveに失敗したらflashを表示し、商品詳細画面に戻ります。
  else
    redirect_to product_path(params.require(:product_id)), notice: 'エラーが発生しました。'
  end
  
  end
  def done
    
  end
end
